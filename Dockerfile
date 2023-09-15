# Build the image from python:3.10-slim-buster
FROM python:3.10-slim-buster
# make and change directory inside the container image to /app
WORKDIR /app
# Copy requirements.txt from host to container image
COPY requirements.txt requirements.txt
# use pip to install the dependencies stated in requirements.txt
RUN pip install -r requirements.txt
# copy everything from the cuurent directory in the host to the current directory in the container image
COPY . .
# set env var
ENV FLASK_ENV=development
# expose port for binding 
EXPOSE ${PORT}
# Run this command to build the container image to run on port 5000
CMD [ "python", "-m" , "flask", "run", "--host=0.0.0.0", "--port=5000"]
