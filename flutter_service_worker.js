'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';
const RESOURCES = {
  "main.dart.js": "3f17dd6054e0403ed58d9e8b40351f66",
"canvaskit/canvaskit.wasm": "bf50631470eb967688cca13ee181af62",
"canvaskit/profiling/canvaskit.wasm": "95a45378b69e77af5ed2bc72b2209b94",
"canvaskit/profiling/canvaskit.js": "38164e5a72bdad0faa4ce740c9b8e564",
"canvaskit/canvaskit.js": "2bc454a691c631b07a9307ac4ca47797",
"manifest.json": "5749f58886e5af4ce4999229953e5c2d",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"flutter.js": "f85e6fb278b0fd20c349186fb46ae36d",
"assets/AssetManifest.json": "4632f2f3751a7bab2995b8c152e829ce",
"assets/shaders/ink_sparkle.frag": "28a404c6523bd094ee13ab7bd8e1534e",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "6d342eb68f170c97609e9da345464e5e",
"assets/FontManifest.json": "dc3d03800ccca4601324923c0b1d6d57",
"assets/fonts/MaterialIcons-Regular.otf": "95db9098c58fd6db106f1116bae85a0b",
"assets/assets/pqr.jpg": "bab14c7e7c55a09b1e4b30a2e59d9b50",
"assets/assets/whatsapp.png": "39c7e49ef30fc5faee4b5313ac38f5a3",
"assets/assets/background.png": "e77f6b685df802b1cfd929a08fcad959",
"assets/assets/port.jfif": "c7624dee0fbd1fe4847da2d958c6c77e",
"assets/assets/ios.png": "7fe15164b759112823f288b3840ceef2",
"assets/assets/github.png": "ad9ae14b8f16bc21fb27b1b122992db1",
"assets/assets/shubham.jpeg": "f2b861ab3da25de7b1b3ce855be60820",
"assets/assets/twitter.png": "ae5fda8651791e27bfa48b4423944106",
"assets/assets/portfolio.png": "b01e93e856f01d8a0d7e99721c9c98f8",
"assets/assets/angular.png": "e8a54707fa06396c86abbd20c617f40d",
"assets/assets/js.png": "31dd1a9cd74113498aec2b4fcab224ea",
"assets/assets/port_b.png": "a7bb94a5e731ea404dc02983da509cea",
"assets/assets/medium.png": "d86de7723f54298c0574f2baa8459685",
"assets/assets/s_1.png": "d52d8ae2bc01d260a3bd48e4933d4e4b",
"assets/assets/abc.jpg": "7b217f49c6c723a3518cb88502d24840",
"assets/assets/s_2.png": "d44e7fd5be273f85d273e5453025c9f0",
"assets/assets/android.png": "5788ea414a892f46acdd29a89f130665",
"assets/assets/shubham.jpg": "efc7a9dc52aa16d26896945cca81ca66",
"assets/assets/s_4.png": "fc880e3aed0a4c0f42d366605868c3c2",
"assets/assets/me.jpg": "79319bd32f1ba2c8cd6dca46ef49b84b",
"assets/assets/insta.png": "dd578c41189d3e760a9ee2079ee50b32",
"assets/assets/fb.png": "9057b7d2290fa97836764b6fbe8c1556",
"assets/assets/b2.jpg": "4d4967efd3e3dc8ba20cb6b9bbf7e50c",
"assets/assets/flutter.png": "b3143a0c9a0736ab932c27521b7e4c42",
"assets/assets/b.jpg": "069b4c4514867e92013fd3d0e3b8bc88",
"assets/assets/data.json": "5c48c20f46fba56806d7201c9ad6e6f9",
"assets/assets/link.png": "e60726da95355a0a9979988eb2d1109f",
"assets/assets/mobileBg.png": "09a50eff16d97e94a39419766122035e",
"assets/assets/s_3.png": "7041769984091eed09b1c09900490858",
"assets/NOTICES": "0b0729edd82cd80d4012f1f59e8eb62e",
"index.html": "5b0faa97d0cd5eb908ad4823ea5eac7b",
"/": "5b0faa97d0cd5eb908ad4823ea5eac7b",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"version.json": "0c47c1ce689973233eefa5aeb1c18d63"
};

// The application shell files that are downloaded before a service worker can
// start.
const CORE = [
  "main.dart.js",
"index.html",
"assets/AssetManifest.json",
"assets/FontManifest.json"];
// During install, the TEMP cache is populated with the application shell files.
self.addEventListener("install", (event) => {
  self.skipWaiting();
  return event.waitUntil(
    caches.open(TEMP).then((cache) => {
      return cache.addAll(
        CORE.map((value) => new Request(value, {'cache': 'reload'})));
    })
  );
});

// During activate, the cache is populated with the temp files downloaded in
// install. If this service worker is upgrading from one with a saved
// MANIFEST, then use this to retain unchanged resource files.
self.addEventListener("activate", function(event) {
  return event.waitUntil(async function() {
    try {
      var contentCache = await caches.open(CACHE_NAME);
      var tempCache = await caches.open(TEMP);
      var manifestCache = await caches.open(MANIFEST);
      var manifest = await manifestCache.match('manifest');
      // When there is no prior manifest, clear the entire cache.
      if (!manifest) {
        await caches.delete(CACHE_NAME);
        contentCache = await caches.open(CACHE_NAME);
        for (var request of await tempCache.keys()) {
          var response = await tempCache.match(request);
          await contentCache.put(request, response);
        }
        await caches.delete(TEMP);
        // Save the manifest to make future upgrades efficient.
        await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
        return;
      }
      var oldManifest = await manifest.json();
      var origin = self.location.origin;
      for (var request of await contentCache.keys()) {
        var key = request.url.substring(origin.length + 1);
        if (key == "") {
          key = "/";
        }
        // If a resource from the old manifest is not in the new cache, or if
        // the MD5 sum has changed, delete it. Otherwise the resource is left
        // in the cache and can be reused by the new service worker.
        if (!RESOURCES[key] || RESOURCES[key] != oldManifest[key]) {
          await contentCache.delete(request);
        }
      }
      // Populate the cache with the app shell TEMP files, potentially overwriting
      // cache files preserved above.
      for (var request of await tempCache.keys()) {
        var response = await tempCache.match(request);
        await contentCache.put(request, response);
      }
      await caches.delete(TEMP);
      // Save the manifest to make future upgrades efficient.
      await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
      return;
    } catch (err) {
      // On an unhandled exception the state of the cache cannot be guaranteed.
      console.error('Failed to upgrade service worker: ' + err);
      await caches.delete(CACHE_NAME);
      await caches.delete(TEMP);
      await caches.delete(MANIFEST);
    }
  }());
});

// The fetch handler redirects requests for RESOURCE files to the service
// worker cache.
self.addEventListener("fetch", (event) => {
  if (event.request.method !== 'GET') {
    return;
  }
  var origin = self.location.origin;
  var key = event.request.url.substring(origin.length + 1);
  // Redirect URLs to the index.html
  if (key.indexOf('?v=') != -1) {
    key = key.split('?v=')[0];
  }
  if (event.request.url == origin || event.request.url.startsWith(origin + '/#') || key == '') {
    key = '/';
  }
  // If the URL is not the RESOURCE list then return to signal that the
  // browser should take over.
  if (!RESOURCES[key]) {
    return;
  }
  // If the URL is the index.html, perform an online-first request.
  if (key == '/') {
    return onlineFirst(event);
  }
  event.respondWith(caches.open(CACHE_NAME)
    .then((cache) =>  {
      return cache.match(event.request).then((response) => {
        // Either respond with the cached resource, or perform a fetch and
        // lazily populate the cache only if the resource was successfully fetched.
        return response || fetch(event.request).then((response) => {
          if (response && Boolean(response.ok)) {
            cache.put(event.request, response.clone());
          }
          return response;
        });
      })
    })
  );
});

self.addEventListener('message', (event) => {
  // SkipWaiting can be used to immediately activate a waiting service worker.
  // This will also require a page refresh triggered by the main worker.
  if (event.data === 'skipWaiting') {
    self.skipWaiting();
    return;
  }
  if (event.data === 'downloadOffline') {
    downloadOffline();
    return;
  }
});

// Download offline will check the RESOURCES for all files not in the cache
// and populate them.
async function downloadOffline() {
  var resources = [];
  var contentCache = await caches.open(CACHE_NAME);
  var currentContent = {};
  for (var request of await contentCache.keys()) {
    var key = request.url.substring(origin.length + 1);
    if (key == "") {
      key = "/";
    }
    currentContent[key] = true;
  }
  for (var resourceKey of Object.keys(RESOURCES)) {
    if (!currentContent[resourceKey]) {
      resources.push(resourceKey);
    }
  }
  return contentCache.addAll(resources);
}

// Attempt to download the resource online before falling back to
// the offline cache.
function onlineFirst(event) {
  return event.respondWith(
    fetch(event.request).then((response) => {
      return caches.open(CACHE_NAME).then((cache) => {
        cache.put(event.request, response.clone());
        return response;
      });
    }).catch((error) => {
      return caches.open(CACHE_NAME).then((cache) => {
        return cache.match(event.request).then((response) => {
          if (response != null) {
            return response;
          }
          throw error;
        });
      });
    })
  );
}
