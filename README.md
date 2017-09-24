## RPI JSON ASCII Video
Save frames from raspberry pi camera as ASCII, in time-stamped json files

## Install
```shell
sudo apt install jp2a
git clone https://github.com/SpaceHexagon/rpi-json-ascii-video
```

## Usage
```shell
cd rpi-json-ascii-video
./start.sh
```

## Playback
There is no player yet, however, the format is as follows:
```json
{
  "config": {
    "columns": 180
  },
  "frames": [
    ".....'''''''''''''',,,;;cOXNNNNNNNNX0000KKXXNNNNNNNNNNNNNNNNNNNNNNN",
    "......'''''''''''',,,;cOXNNNNNNNNNKKKKXXNNNNNNNNNNNNNNNNNNNNNNNNNNN",
  ]
}
```
