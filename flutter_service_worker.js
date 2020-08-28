'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';
const RESOURCES = {
  "icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"main.dart.js": "7b630321dccfa8c3785a20cfc50c3779",
"index.html": "b39176c204559652df8030af1efd355f",
"/": "b39176c204559652df8030af1efd355f",
"manifest.json": "5749f58886e5af4ce4999229953e5c2d",
"assets/FontManifest.json": "dc3d03800ccca4601324923c0b1d6d57",
"assets/fonts/MaterialIcons-Regular.otf": "a68d2a28c526b3b070aefca4bac93d25",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "115e937bb829a890521f72d2e664b632",
"assets/AssetManifest.json": "d7865912792453a21a9943eeff4dff81",
"assets/NOTICES": "347e04621a1ef2be218eaedd438c969c",
"assets/assets/android.png": "5788ea414a892f46acdd29a89f130665",
"assets/assets/shubham.jpg": "efc7a9dc52aa16d26896945cca81ca66",
"assets/assets/me.jpg": "79319bd32f1ba2c8cd6dca46ef49b84b",
"assets/assets/insta.png": "dd578c41189d3e760a9ee2079ee50b32",
"assets/assets/b.jpg": "069b4c4514867e92013fd3d0e3b8bc88",
"assets/assets/portfolio.png": "b01e93e856f01d8a0d7e99721c9c98f8",
"assets/assets/port_b.png": "a7bb94a5e731ea404dc02983da509cea",
"assets/assets/github.png": "ad9ae14b8f16bc21fb27b1b122992db1",
"assets/assets/medium.png": "d86de7723f54298c0574f2baa8459685",
"assets/assets/pqr.jpg": "bab14c7e7c55a09b1e4b30a2e59d9b50",
"assets/assets/abc.jpg": "7b217f49c6c723a3518cb88502d24840",
"assets/assets/data.json": "ffa7c954dcbc43007bd09a3007fbae98",
"assets/assets/fb.png": "9057b7d2290fa97836764b6fbe8c1556",
"assets/assets/twitter.png": "ae5fda8651791e27bfa48b4423944106",
"assets/assets/background.png": "e77f6b685df802b1cfd929a08fcad959",
"assets/assets/flutter.png": "b3143a0c9a0736ab932c27521b7e4c42",
"assets/assets/whatsapp.png": "ad1f75e360b068745ae20e8b1b3d97c4",
"assets/assets/js.png": "31dd1a9cd74113498aec2b4fcab224ea",
"assets/assets/port.jfif": "c7624dee0fbd1fe4847da2d958c6c77e",
"assets/assets/ios.png": "7fe15164b759112823f288b3840ceef2",
"assets/assets/link.png": "e60726da95355a0a9979988eb2d1109f",
"assets/assets/angular.png": "e8a54707fa06396c86abbd20c617f40d",
"assets/assets/b2.jpg": "4d4967efd3e3dc8ba20cb6b9bbf7e50c"
};

// The application shell files that are downloaded before a service worker can
// start.
const CORE = [
  "/",
"main.dart.js",
"index.html",
"assets/NOTICES",
"assets/AssetManifest.json",
"assets/FontManifest.json"];

// During install, the TEMP cache is populated with the application shell files.
self.addEventListener("install", (event) => {
  return event.waitUntil(
    caches.open(TEMP).then((cache) => {
      return cache.addAll(
        CORE.map((value) => new Request(value + '?revision=' + RESOURCES[value], {'cache': 'reload'})));
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
  var origin = self.location.origin;
  var key = event.request.url.substring(origin.length + 1);
  // Redirect URLs to the index.html
  if (event.request.url == origin || event.request.url.startsWith(origin + '/#')) {
    key = '/';
  }
  // If the URL is not the RESOURCE list, skip the cache.
  if (!RESOURCES[key]) {
    return event.respondWith(fetch(event.request));
  }
  event.respondWith(caches.open(CACHE_NAME)
    .then((cache) =>  {
      return cache.match(event.request).then((response) => {
        // Either respond with the cached resource, or perform a fetch and
        // lazily populate the cache. Ensure the resources are not cached
        // by the browser for longer than the service worker expects.
        var modifiedRequest = new Request(event.request, {'cache': 'reload'});
        return response || fetch(modifiedRequest).then((response) => {
          cache.put(event.request, response.clone());
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
    return self.skipWaiting();
  }

  if (event.message === 'downloadOffline') {
    downloadOffline();
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
  for (var resourceKey in Object.keys(RESOURCES)) {
    if (!currentContent[resourceKey]) {
      resources.push(resourceKey);
    }
  }
  return contentCache.addAll(resources);
}
