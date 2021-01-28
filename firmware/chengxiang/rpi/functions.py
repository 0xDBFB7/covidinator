import RPi.GPIO as GPIO
from time import sleep
import code

STEP_PIN = 7
DIR_PIN = 21
LIMIT_PIN = 22
TRIGGER_PIN = 11
ENABLE_PIN = 19 #might be 16

GPIO.setmode(GPIO.BOARD)

DEG_PER_STEP = 18.0
SCREW_PITCH = 0.5 # //mm
MICROSTEPS = 4
distance_per_step = ((DEG_PER_STEP / 360.0) * SCREW_PITCH);
#
GPIO.setup(STEP_PIN, GPIO.OUT)
GPIO.setup(DIR_PIN, GPIO.OUT)
GPIO.setup(TRIGGER_PIN, GPIO.OUT)
GPIO.setup(ENABLE_PIN, GPIO.OUT)

GPIO.setup(LIMIT_PIN, GPIO.IN)



position = 0.0

def move_absolute(new_position,speed=(500 * 1e-6)):
    global position
    print("Moving to {} from {}\n".format(new_position, position))
    delta = new_position - position
    move_relative(delta < 0, abs(delta), speed=speed)
    position = new_position



def move_relative(direction, distance, speed=(500 * 1e-6)):
    GPIO.output(DIR_PIN, bool(direction))
    GPIO.output(ENABLE_PIN, 0)

    num_steps = distance/distance_per_step * MICROSTEPS;

    # speed = 500 * 1e-6

    for i in range(int(num_steps)):
    	GPIO.output(STEP_PIN, 1)
    	sleep(speed) #microseconds

    	GPIO.output(STEP_PIN, 0)
    	sleep(speed) #microseconds

    GPIO.output(ENABLE_PIN, 1)


def home():
    while(GPIO.input(LIMIT_PIN)):
        move_relative(1,1)

    GPIO.output(DIR_PIN, 0)
    GPIO.output(ENABLE_PIN, 0)

    while(not GPIO.input(LIMIT_PIN)):
    	GPIO.output(STEP_PIN, 1)
    	sleep(500 * 1e-6) #microseconds

    	GPIO.output(STEP_PIN, 0)
    	sleep(500 * 1e-6) #microseconds

    GPIO.output(ENABLE_PIN, 1)
    global position
    position = 0


def pulse(enabled):
    if(enabled):
        GPIO.output(TRIGGER_PIN, 1)
    sleep(1500 * 1e-6) #microseconds
    GPIO.output(TRIGGER_PIN, 0)
