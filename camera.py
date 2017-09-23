from picamera import PiCamera
from time import sleep

camera = PiCamera()

camera.start_preview(alpha=200)

sleep(1)
camera.capture('./image.jpg')
camera.stop_preview()
