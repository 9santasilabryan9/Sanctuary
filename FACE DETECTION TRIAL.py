import numpy as np
import cv2

cap = cv2.VideoCapture(0)
face_cascade = cv2.CascadeClassifier(cv2.data.haarcascades + 'haarcascade_frontalface_default.xml')
eye_cascade = cv2.CascadeClassifier(cv2.data.haarcascades + 'haarcascade_eye.xml')

while True:
    ret, frame = cap.read()

    gray = cv2.cvtColor(frame, cv2.COLOR_BGR2GRAY)
    faces = face_cascade.detectMultiScale(gray, 1.3, 5)
    for (x, y, w, h) in faces:
        cv2.rectangle(frame, (x, y), (x + w, y + h), (255, 0, 0), 5)
        roi_gray = gray[y:y+w, x:x+w]
        roi_color = frame[y:y+h, x:x+w]
        eyes = eye_cascade.detectMultiScale(roi_gray, 1.3, 5)
        for (ex, ey, ew, eh) in eyes:
            cv2.rectangle(roi_color, (ex, ey), (ex + ew, ey + eh), (0, 255, 0), 5)

    cv2.imshow('frame', frame)

    if cv2.waitKey(1) == ord('q'):
        break

cap.release()
cv2.destroyAllWindows()

#TUTORIAL OPENCV BASIC 

import cv2
# -1 is the default, brg color. 0 is black and white and 1 is brg that eliminate the transparant background
img = cv2.imread('nameofimage',1)
img = cv2.resize(img, (400,400)) # resize the picture taht is displayed

# can also resize by doing this (just scale the image)
img = cv2.resize(img, (0,0), fx=0.5, fy = 0.5) #scaled by half

# rotate 
img = cv2.rotate(img, cv2.cv2.ROTATE_90_CLOCKWISE)

#Write out image after modification
cv2.imwrite('nameofimage2', img)

cv2.imshow('Image', img)
cv2.waitKey(0)
cv2.destroyAllWindows()

print(img.shape)

# waitKey means wait how many second, if 0 then it means the window will never close unless we press any button