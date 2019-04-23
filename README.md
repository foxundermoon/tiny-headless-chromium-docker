# tiny-headless-chromium-docker
the tiny headless chrome service

# start chrome service

```
docker run -it --rm -p 9222:9222  foxundermoon/tiny-chrome
```



# custom command

```
docker run -it --rm -p 9222:9222  foxundermoon/tiny-chrome chromium-browser --headless --disable-gpu  --no-sandbox  --user-data-dir=/data  --remote-debugging-address=0.0.0.0 --remote-debugging-port=9222
```