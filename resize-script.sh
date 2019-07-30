#!/bin/bash
#simple script for resizing images in all class directories
#also reformats everything from whatever to png
# Originaly from JPG-PNG-to-MNIST-NN-Format Project and modified by tikroute

if [ `ls train/*.jpg 2> /dev/null | wc -l ` -gt 0 ]; then
  echo hi
  for file in train/*.jpg; do
    convert "$file" -resize 28x28\! "${file%.*}.png"
    file "$file" #uncomment for testing
    rm "$file"
  done
fi

if [ `ls train/*/*.png 2> /dev/null | wc -l ` -gt 0 ]; then
  echo hi
  for file in train/*/*.png; do
    convert "$file" -resize 28x28\! "${file%.*}.png"
    file "$file" #uncomment for testing
  done
fi

if [ `ls test/*/*.jpg 2> /dev/null | wc -l ` -gt 0 ]; then
  echo hi
  for file in test/*/*.jpg; do
    convert "$file" -resize 28x28\! "${file%.*}.png"
    file "$file" #uncomment for testing
    rm "$file"
  done
fi

if [ `ls test/*/*.png 2> /dev/null | wc -l ` -gt 0 ]; then
  echo hi
  for file in test/*/*.png; do
    convert "$file" -resize 28x28\! "${file%.*}.png"
    file "$file" #uncomment for testing
  done
fi
if [ `ls valid/*/*.jpg 2> /dev/null | wc -l ` -gt 0 ]; then
  echo hi
  for file in valid/*/*.jpg; do
    convert "$file" -resize 28x28\! "${file%.*}.png"
    file "$file" #uncomment for testing
    rm "$file"
  done
fi

if [ `ls valid/*/*.png 2> /dev/null | wc -l ` -gt 0 ]; then
  echo hi
  for file in valid/*/*.png; do
    convert "$file" -resize 28x28\! "${file%.*}.png"
    file "$file" #uncomment for testing
  done
fi
