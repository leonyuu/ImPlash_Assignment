# Project ImSplash Assignment
- Interview project for applying iOS position at Maple Labs.

## Requirement
1. Create an iOS application, ImSplash based on provided Sketch design.
![alt text](https://github.com/leonyuu/ImPlash_Assignment/blob/master/sketch_design.png)
2. Application should work with the published APIs from free photos UnSplash https://unsplash.com/documentation

## System
- iOS >= 11
- Swift 5.0

## Build and Install
Clone code project from repo https://github.com/leonyuu/ImPlash_Assignment

> pod install

Open ***ImPlash.xcworkspace*** > Select target ***ImSplash*** > Run

![alt text](https://github.com/leonyuu/ImPlash_Assignment/blob/master/xcode_run.png)

## What I've done
Home Screen
- Load the photo list from the Unsplash server.
- Fetch data and do pagination when scrolling down to the end of the screen.
- The photo view screen will show up when clicking the photo items.

Photo View Screen
- Show the full screen with the exact photo ratio.
- Display user name and avatar.

## Incompleted parts
Photo View Screen
- Photos will be added into Favorite when clicking into the heart icon (local database).
- Photos will be added into Download Queue when clicking into the download icon.

Collection Screen
- Add and remove images from Favorite.
- Show the queue to download multiple items (download the original size).

## App Demonstration
![alt text](https://github.com/leonyuu/ImPlash_Assignment/blob/master/app_demo.gif)

## MIT License

Copyright (c) 2020 Leon Yuu

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
