FROM alpine

LABEL author="github.com/foxundermoon"


RUN apk add  --no-cache chromium tini &&  \
  echo "@edge http://nl.alpinelinux.org/alpine/edge/testing" >> /etc/apk/repositories && \
  apk add --no-cache wqy-zenhei@edge && \
  apk add --no-cache mesa-dev && \
  mkdir -p /usr/lib/chromium/swiftshader/ && \
  ln -s /usr/lib/libGLESv2.so /usr/lib/chromium/swiftshader/libGLESv2.so && \
  ln -s /usr/lib/libEGL.so /usr/lib/chromium/swiftshader/libEGL.so  && \
  rm -rf /var/cache/* && \
  rm -f /usr/lib/libLLVM-5.0.so && \
  rm -f /usr/lib/libOSMesa.so.8.0.0 && \
  rm -f /usr/lib/libX11.a  && \
  mkdir /var/cache/apk


ENTRYPOINT [ "tini", "--" ]

EXPOSE 9222

VOLUME [ "/data" ]


CMD [ "chromium-browser" \
  , "--headless" \
  , "--no-sandbox" \
  , "--remote-debugging-port=9222" \
  , "--remote-debugging-address=0.0.0.0" \
  , "--window-size=1920,1080" \
  , "--user-data-dir=/data" \
  , "--disable-dev-shm-usage" \
  , "--disable-background-networking" \
  , "--enable-features=NetworkService,NetworkServiceInProcess" \
  , "--disable-background-timer-throttling" \
  , "--disable-backgrounding-occluded-windows" \
  , "--disable-breakpad--disable-client-side-phishing-detection" \
  , "--disable-default-apps" \
  , "--disable-dev-shm-usage" \
  , "--disable-extensions" \
  , "--disable-features=site-per-process,TranslateUI,BlinkGenPropertyTrees" \
  , "--disable-hang-monitor" \
  , "--disable-ipc-flooding-protection" \
  , "--disable-popup-blocking" \
  , "--disable-prompt-on-repost" \
  , "--disable-renderer-backgrounding" \
  , "--disable-sync" \
  , "--disable-notifications" \
  , "--disable-translate" \
  , "--force-color-profile=srgb" \
  , "--metrics-recording-only" \
  , "--no-first-run" \
  , "--safebrowsing-disable-auto-update" \
  , "--enable-automation" \
  , "--password-store=basic" \
  , "--use-mock-keychain" \
  , "--hide-scrollbars" \
  , "--mute-audio" ]