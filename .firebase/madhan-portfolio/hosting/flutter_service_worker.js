'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"manifest.json": "e8e223e9a486728ecd610b78edf6ee17",
"flutter.js": "6fef97aeca90b426343ba6c5c9dc5d4a",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"main.dart.js": "2ce69fa8228f3297455d4b172246396b",
"canvaskit/skwasm.js": "1df4d741f441fa1a4d10530ced463ef8",
"canvaskit/skwasm.wasm": "6711032e17bf49924b2b001cef0d3ea3",
"canvaskit/skwasm.worker.js": "19659053a277272607529ef87acf9d8a",
"canvaskit/chromium/canvaskit.wasm": "fc18c3010856029414b70cae1afc5cd9",
"canvaskit/chromium/canvaskit.js": "8c8392ce4a4364cbb240aa09b5652e05",
"canvaskit/canvaskit.wasm": "f48eaf57cada79163ec6dec7929486ea",
"canvaskit/canvaskit.js": "76f7d822f42397160c5dfc69cbc9b2de",
"index.html": "0bb178175d1b0fc430c480f02ae1173c",
"/": "0bb178175d1b0fc430c480f02ae1173c",
"version.json": "c75d6d5206ade3450201143c2b0c1fad",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "57d849d738900cfd590e9adc7e208250",
"assets/packages/font_awesome_flutter/lib/fonts/fa-solid-900.ttf": "efc6c90b58d765987f922c95c2031dd2",
"assets/packages/font_awesome_flutter/lib/fonts/fa-brands-400.ttf": "0db203e8632f03baae0184700f3bda48",
"assets/packages/font_awesome_flutter/lib/fonts/fa-regular-400.ttf": "01bb14ae3f14c73ee03eed84f480ded9",
"assets/fonts/MaterialIcons-Regular.otf": "2aed95907ce4b37242a4f0fe8b09ce1c",
"assets/AssetManifest.json": "40bcc4ac4fbbbf931834bb491f05aac3",
"assets/AssetManifest.bin": "457849e2873e21e1a72b4ade409420e3",
"assets/FontManifest.json": "5a32d4310a6f5d9a6b651e75ba0d7372",
"assets/NOTICES": "88816f08300179dcbe42b81c868b830e",
"assets/shaders/ink_sparkle.frag": "f8b80e740d33eb157090be4e995febdf",
"assets/assets/images/firebase.png": "81debcc1a205da064af1604931ddaeb0",
"assets/assets/images/python.png": "162ee83dbba7afc24d8f2009c7a22dc5",
"assets/assets/images/html.png": "1c1d1073881b5322548e7d0247cb33c6",
"assets/assets/images/js.png": "94ae2dcd4fa410811cab4e1fbb403340",
"assets/assets/images/dart.png": "9271c5feaa7176d4bc87467c11eaa8c0",
"assets/assets/images/sqllite.png": "26e125bb824588921beb2c97758e7388",
"assets/assets/images/who_am_i.jpg": "8533bee1a55e6b5541447b4989ec2337",
"assets/assets/images/kotlin.png": "2cf9a4b79c73281bfa2bd18d4c590f0b",
"assets/assets/images/hive.png": "e7b2ff5773a10b36a5f771c39e813c32",
"assets/assets/images/css.png": "c9421be52fe48fdf04839b53f8e9f1d4",
"assets/assets/images/flutter.png": "e417bcfb1a718192ff6e2aa86799460a",
"assets/assets/json/data.json": "29f5774bed795b3d4a4de92ab01467ac",
"assets/assets/json/contact.json": "cba770348341394a5a9ec6b8c40f3e9c",
"assets/assets/json/about.json": "8015de688f0e5f4c4154f49fd8c3992c",
"assets/assets/json/home_lottie.json": "23e99a34aeeca17413a6e4941409c54e",
"assets/assets/project_assets/Screenshot_1685438738.png": "6a4453e038e5afa83d9c0d5ed5d109aa",
"assets/assets/project_assets/movie_find.png": "18f95d504d364b8d917690c4ffd6de31",
"assets/assets/project_assets/Screenshot_1685439412.png": "8a9f410f29b5386a9bd6c2e2645ea52b",
"assets/assets/project_assets/insta_remove.png": "6411ac0a6df3bfb1301145878ab54731",
"assets/assets/project_assets/bitsnap_detail.png": "173effc3f4920649bd7580ff4dd51cba",
"assets/assets/project_assets/Screenshot_1685444429.png": "de96d24212d183decabf63aaf38347bb",
"assets/assets/project_assets/insta_home.png": "c442afcac57f80f2645bbac503f3bede",
"assets/assets/project_assets/thai_carts.png": "61568cf9cf855a9e0c656df59472201e",
"assets/assets/project_assets/Screenshot_1685438548.png": "5a7d2944901029b96ce6d81af9f458eb",
"assets/assets/project_assets/Screenshot_1685443391.png": "6f166ce8ea2f9fdf5d701b407d5d2f11",
"assets/assets/project_assets/movie_home.png": "070cca680d6bca1bcd3bb5e14d3706cb",
"assets/assets/project_assets/todo_sort.png": "de96d24212d183decabf63aaf38347bb",
"assets/assets/project_assets/todo_new.png": "030ae4362970044351baf7e9773dca21",
"assets/assets/project_assets/thai_conn.png": "15710586eaf27d3eca8c4c4d218fde6a",
"assets/assets/project_assets/todo_filter.png": "ab8e7443cce50300ceb997b9804e2654",
"assets/assets/project_assets/insta_search.png": "4dfaf22cda6ce206015f6e515422fad9",
"assets/assets/project_assets/todo_test.png": "7f7b031d518795dab9dae3c9dc1f2535",
"assets/assets/project_assets/Screenshot_1685444452.png": "7f7b031d518795dab9dae3c9dc1f2535",
"assets/assets/project_assets/movie_filter.png": "8d7bd352395afd9e6b4daeb83ef8275c",
"assets/assets/project_assets/todo_main.png": "dd9c701db9a7b243fef21ad5696f202e",
"assets/assets/project_assets/insta_login.png": "40ce802be31dd2f714848583f020a8d9",
"assets/assets/project_assets/bitstamp.png": "256b021cde8027de14480b387ee76f2b",
"assets/assets/project_assets/movie_search.png": "e9a93b69eb4f43c6ec4534c8bdf346b8",
"assets/assets/project_assets/thai_one.png": "ab3bbcd79897dbb5eef19155c33910c2",
"assets/assets/project_assets/swiper.png": "4c5b2b6b33dedda992d24f5ade114413",
"assets/assets/project_assets/Screenshot_1685443322.png": "0add7f82f3b891bad2294523b325d453"};
// The application shell files that are downloaded before a service worker can
// start.
const CORE = ["main.dart.js",
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
        // Claim client to enable caching on first launch
        self.clients.claim();
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
      // Claim client to enable caching on first launch
      self.clients.claim();
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
