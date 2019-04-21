FROM alpine

LABEL author="foxundermoon"


RUN apk add chromium &&  \
  apk add mesa-dev && \
  && mkdir -p /usr/lib/chromium/swiftshader/ && \
  ln -s /usr/lib/libGLESv2.so /usr/lib/chromium/swiftshader/libGLESv2.so && \
  ln -s /usr/lib/libEGL.so /usr/lib/chromium/swiftshader/libEGL.so && \



  EXPOSE 9222

VOLUME [ "/data" ]

# "--disable-gpu",

CMD [ "chromium-browser", "--headless",  "--no-sandbox", "--disable-dev-shm-usage","--disable-background-networking", "--enable-features=NetworkService,NetworkServiceInProcess", "--disable-background-timer-throttling", "--disable-backgrounding-occluded-windows", "--disable-breakpad--disable-client-side-phishing-detection", "--disable-default-apps", "--disable-dev-shm-usage", "--disable-extensions", "--disable-features=site-per-process,TranslateUI,BlinkGenPropertyTrees", "--disable-hang-monitor", "--disable-ipc-flooding-protection", "--disable-popup-blocking", "--disable-prompt-on-repost",  "--disable-renderer-backgrounding", "--disable-sync",  "--force-color-profile=srgb", "--metrics-recording-only", "--no-first-run", "--safebrowsing-disable-auto-update", "--enable-automation", "--password-store=basic", "--use-mock-keychain",  "--hide-scrollbars", "--mute-audioabout:blank", "--enable-logging", "--v1=1", "--remote-debugging-port=9222", "--user-data-dir=/data" ]