# Copyright 2021 ETH Zurich and University of Bologna.
# Licensed under the Apache License, Version 2.0, see https://www.apache.org/licenses/LICENSE-2.0 for details.
# SPDX-License-Identifier: Apache-2.0
#
# Author: Viviane Potocnik <vivianep@iis.ee.ethz.ch> (ETH Zurich) 

import matplotlib.pyplot as plt
import numpy as np
import serial
import sys
import time
import tkinter as tk
from PIL import Image, ImageTk

if __name__ == '__main__':
    x_test = np.load('x_test_fmnist.npy')
    y_test = np.load('y_test_fmnist.npy').squeeze()

    dataset_name = sys.argv[1]
    classes = []

    if dataset_name == 'mnist':
        classes = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9']
    elif dataset_name == 'cifar10':
        classes = ['airplane', 'automobile', 'bird', 'cat', 'deer', 'dog',
                   'frog', 'horse', 'ship', 'truck']
    elif dataset_name == 'fmnist':
        classes = ["T-shirt/top", "Trouser", "Pullover", "Dress", "Coat",
                   "Sandal", "Shirt", "Sneaker", "Bag", "Ankle boot"]

    print(f'Loaded x with shape: {x_test.shape}')
    print(f'Loaded y with shape: {y_test.shape}')

    ser = serial.Serial(port='COM3', baudrate=115200, timeout=3)
    # flush the serial port
    ser.flush()
    ser.flushInput()
    ser.flushOutput()

    correct_count = 0
    # define how many images from the test set to send to the MCU
    test_len = 20
    # get how many predictions we iterated over
    num_pred = 0

    for x, y in zip(x_test[:test_len], y_test[:test_len]):
        num_pred += 1
        class_idx = y
        ser.write(x.tobytes())
        time.sleep(1)
        img = ser.read(28*28)
        img = np.frombuffer(img, dtype=np.uint8)
        print("Image sent to the MCUs: \n {}".format(img))
        time.sleep(1)
        pred = ser.read(10)
        pred = np.frombuffer(pred, dtype=np.uint8)
        print(pred)
        print(f'Target: {classes[class_idx]}, Prediction (from MCU): {classes[np.argmax(pred)]}')
        if np.argmax(pred) == class_idx:
            correct_count += 1

        root = tk.Tk()
        root.title('Real-time Inference')

        # Create an image from the numpy array
        image = Image.fromarray(x.astype(np.uint8))
        image = image.resize((280, 280))  # Adjust size as needed
        photo = ImageTk.PhotoImage(image)

        root.grid_rowconfigure((0, 1, 2, 3, 4), weight=1)
        root.grid_columnconfigure((0, 1), weight=1)
        color = '#0B8457' if np.argmax(pred) == class_idx else '#F24C4C'
        darkgrey = '#2D2D2D'
        yellow = '#FFC107'
        quit_color = '#DA0037'
        next_color = '#3E497A'
        next_hover_color = '#3AB4F2'

        # Display the image
        image_label = tk.Label(master=root, image=photo)
        image_label.image = photo  # Keep a reference to prevent garbage collection
        image_label.grid(row=0, column=0, padx=(10, 5), pady=10, columnspan=2)

        # Prediction label
        pred_text = f'Prediction: {classes[np.argmax(pred)]}'
        pred_label = tk.Label(root, text=pred_text, font=('Helvetica', 18, 'bold'),
                              bg=color, fg='white')
        pred_label.grid(row=1, column=0, padx=(10, 5), pady=10, sticky='nsew')

        # Target label
        target_text = f'Target: {classes[class_idx]}'
        target_label = tk.Label(root, text=target_text, font=('Helvetica', 18, 'bold'),
                                bg=color, fg='white')
        target_label.grid(row=1, column=1, padx=(5, 10), pady=10, sticky='nsew')

        # Accuracy label
        accuracy = (correct_count / num_pred) * 100
        accuracy_text = f'Accuracy: {accuracy:.2f}%'
        accuracy_label = tk.Label(root, text=accuracy_text, font=('Helvetica', 18, 'bold'),
                                  bg=yellow, fg=darkgrey)
        accuracy_label.grid(row=2, column=0, padx=(10, 10), pady=10, columnspan=2, sticky='nsew')

        # Functions to handle button clicks
        def next_image():
            root.quit()
            root.destroy()

        def quit_program():
            root.quit()
            root.destroy()
            sys.exit()

        # Next button
        next_button = tk.Button(root, text='Next', command=next_image,
                                font=('Helvetica', 18, 'bold'), bg=next_color, fg='white',
                                activebackground=next_hover_color, activeforeground='white')
        next_button.grid(row=3, column=0, padx=(10, 5), pady=10, columnspan=2, sticky='nsew')

        # Quit button
        quit_button = tk.Button(root, text='Quit', command=quit_program,
                                font=('Helvetica', 18, 'bold'), bg=next_color, fg='white',
                                activebackground=quit_color, activeforeground='white')
        quit_button.grid(row=4, column=0, padx=(10, 5), pady=10, columnspan=2, sticky='nsew')

        root.mainloop()

