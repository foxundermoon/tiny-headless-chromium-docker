FROM alpine

LABEL author="github.com/foxundermoon"


RUN apk add  --no-cache chromium tini &&  \
  apk add mesa-dev && \
  mkdir -p /usr/lib/chromium/swiftshader/ && \
  ln -s /usr/lib/libGLESv2.so /usr/lib/chromium/swiftshader/libGLESv2.so && \
  ln -s /usr/lib/libEGL.so /usr/lib/chromium/swiftshader/libEGL.so  && \
  rm -rf /var/cache/* &&\
  mkdir /var/cache/apk


ENTRYPOINT [ "tini", "--" ]

EXPOSE 9222

VOLUME [ "/data" ]


CMD [ "chromium-browser", "--headless",  "--no-sandbox", "--disable-dev-shm-usage","--disable-background-networking", "--enable-features=NetworkService,NetworkServiceInProcess", "--disable-background-timer-throttling", "--disable-backgrounding-occluded-windows", "--disable-breakpad--disable-client-side-phishing-detection", "--disable-default-apps", "--disable-dev-shm-usage", "--disable-extensions", "--disable-features=site-per-process,TranslateUI,BlinkGenPropertyTrees", "--disable-hang-monitor", "--disable-ipc-flooding-protection", "--disable-popup-blocking", "--disable-prompt-on-repost",  "--disable-renderer-backgrounding", "--disable-sync",  "--force-color-profile=srgb", "--metrics-recording-only", "--no-first-run", "--safebrowsing-disable-auto-update", "--enable-automation", "--password-store=basic", "--use-mock-keychain",  "--hide-scrollbars", "--mute-audioabout:blank", "--enable-logging", "--v1=1", "--remote-debugging-port=9222", "--remote-debugging-host=0.0.0.0", "--user-data-dir=/data" ]