# Base Image: Use Python and an official slim version
FROM python:3.12.3-alpine

# Set Working Directory inside the container
WORKDIR /app

# preven python from writing .pyc files
ENV PYTHONDONTWRITEBYTECODE 1

# ensure python output is send directly
# to the terminal without buffering
ENV PYTHONUNBUFFERED 1

# upgrade pip
RUN pip install --upgrade pip

# Install dependencies
COPY ./requirements.txt /app/requirements.txt  
RUN pip install -r requirements.txt  

COPY ./entrypoint.sh /app/entrypoint.sh
RUN chmod +x entrypoint.sh

# Copy Project Files
COPY . /app/

# ENTRYPOINT
ENTRYPOINT [ "/app/entrypoint.sh" ]

# Expose the port Django will run on
# EXPOSE 8000

# Run the Django development server by default
# CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]
