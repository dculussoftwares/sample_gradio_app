# bethcimini/docker-gradio-demo:latest
# docker build -t bethcimini/docker-gradio-demo:latest . 
# docker run -it --rm -p 127.0.0.1:8080:8080 bethcimini/docker-gradio-demo:latest
# docker push bethcimini/docker-gradio-demo:latest

# Define an image to start from. 
FROM --platform=linux/amd64 python:3.9-slim as build

# Install the dependencies for the gradio app
RUN python -m pip install gradio==3.25.0 gradio_client==0.1.3 scipy==1.9.1 scikit-image==0.20.0 huggingface-hub==0.14.0 pydantic==1.10.7

# Add app.py from the directory where `docker build` was run and add it into the
# workspace directory within the container
ADD app.py /workspace/

# Expose port 8080. You CAN do this from the command line, but it makes it possible to run entirely in the app
EXPOSE 8080 80

# Run the app. Will be accessible at http://localhost:8080/
CMD [ "python3" , "/workspace/app.py" ]
