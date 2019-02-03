# Minimal AMV-FFmpeg Docker image built on Ubuntu 14.04

## AMV-FFmpeg

AMV-FFMpeg is a ffmpeg fork to provide AMV format encoder.

See ihttps://vsubhash.wordpress.com/2014/03/02/how-to-convert-any-video-file-to-amv-using-ffmpeg/

Sources : https://github.com/vsubhash/amv-ffmpeg

## Usage

```
$ docker run -it --user $(id -u):$(id -g) -v `pwd`:/tmp/amv-ffmpeg mwerlen/amv-ffmpeg -i wmv-converted.wmv -f amv -r 16 -ac 1 -ar 22050 -qmin 3 -qmax 3 converted-video.amv
```

You can create an alias so you use the Docker container like if FFmpeg is installed on your computer:

In `~/.bashrc`:

```
alias amv-ffmpeg='docker run -it --user $(id -u):$(id -g) -v `pwd`:/tmp/amv-ffmpeg mwerlen/amv-ffmpeg'
```

Now we can execute FFmpeg with just:

```
$ amv-ffmpeg -buildconf
```
