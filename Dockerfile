# Use an official Python runtime as a parent image
FROM python:3.11

# Set the working directory in the container
WORKDIR /code

# Copy the current directory contents into the container at /app
COPY ./requirements.txt /code/requirements.txt

# Install any needed packages specified in requirements.txt
RUN pip install --no-cache-dir --upgrade -r /code/requirements.txt

#
COPY ./app /code/app

# Make port 8000 available to the world outside this container
EXPOSE 8000

# Run Gunicorn when the container launches
CMD ["gunicorn", "app.main:app", "--workers=2", "-k", "uvicorn.workers.UvicornWorker", "--bind", "0.0.0.0:8000"]


