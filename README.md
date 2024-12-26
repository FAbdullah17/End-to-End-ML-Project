## End to End ML Project
## Student Exam Performance Monitor

This project is an end-to-end machine learning application that predicts students' math scores based on various demographic and educational factors. The application is built using Flask for the web interface and integrates machine learning models for the prediction task. Below is a detailed explanation of the project structure, setup, and usage.

---

## Table of Contents
1. [Overview](#overview)
2. [Features](#features)
3. [Tech Stack](#tech-stack)
4. [Project Structure](#project-structure)
5. [Setup Instructions](#setup-instructions)
6. [Usage](#usage)
7. [Model Training](#model-training)
8. [Web Application](#web-application)
9. [Deployment](#deployment)
10. [Future Enhancements](#future-enhancements)

---

## Overview
The **Student Exam Performance Predictor** uses demographic and educational inputs to estimate a student’s math performance. The tool is useful for educators to assess and predict potential student outcomes based on available data.

---

## Features
- **Interactive Web Interface**: Input student details and get immediate predictions.
- **Customizable Model**: Easily retrain the model with updated data.
- **Efficient Deployment**: Hosted using Flask for seamless integration and deployment.
- **Insightful Predictions**: Use various predictors such as gender, parental education level, and test preparation completion status.

---

## Tech Stack
- **Programming Languages**: Python
- **Frameworks**: Flask
- **Libraries**: Pandas, NumPy, Scikit-learn, Matplotlib
- **Frontend**: HTML, CSS (Jinja2 templates)
- **Version Control**: Git

---

## Project Structure
```
|-- .ebextensions/       # Elastic Beanstalk configuration (if applicable)
|-- artifacts/           # Saved machine learning models and related files
|-- notebook/            # Jupyter Notebooks for data exploration and model training
|-- src/                 # Source files for preprocessing and utilities
|-- templates/           # HTML templates for the Flask app
|-- .gitignore           # Git ignored files
|-- README.md            # Project documentation
|-- app.py               # Flask application entry point
|-- application.py       # Alternate entry point for deployment
|-- requirements.txt     # Python dependencies
|-- setup.py             # Packaging and setup configurations
```

---

## Setup Instructions

1. **Clone the Repository**
   ```bash
   git clone https://github.com/FAbdullah17/End-to-End-ML-Project.git
   cd End-to-End-ML-Project
   ```

2. **Set Up a Virtual Environment** (optional but recommended)
   ```bash
   python -m venv venv
   source venv/bin/activate   # On Windows: venv\Scripts\activate
   ```

3. **Install Dependencies**
   ```bash
   pip install -r requirements.txt
   ```

4. **Run the Flask Application**
   ```bash
   python app.py
   ```

   The application will be accessible at `http://127.0.0.1:5000/`.

---

## Usage

### Web Application
1. Open the web application in a browser.
2. Fill in the fields such as gender, parental education level, test preparation status, etc.
3. Click the **Predict your Maths Score** button.
4. View the predicted math score based on the input values.

### Inputs Required
- **Gender**: Male/Female
- **Race/Ethnicity**: Group A, B, C, etc.
- **Parental Education**: High school, Bachelor’s Degree, etc.
- **Lunch Status**: Free/Reduced or Standard
- **Test Preparation**: Completed or Not Completed
- **Reading Score**: Integer value
- **Writing Score**: Integer value

### Output
- Predicted math score (integer value).

---

## Model Training

The training pipeline for the machine learning model includes:
1. **Data Preprocessing**:
   - Handling missing values
   - Encoding categorical features
   - Scaling numerical features
2. **Model Selection**:
   - Algorithms tested: Linear Regression, Decision Trees, Random Forest
   - Final Model: (e.g., Random Forest with optimized hyperparameters)
3. **Evaluation**:
   - Metrics: RMSE, R2 Score

The model training process is available in the `notebook/` folder.

---

## Web Application

The Flask app consists of the following components:
- **Templates**:
  - HTML files stored in the `templates/` folder.
  - Responsive and user-friendly design.
- **Routes**:
  - `GET /`: Displays the input form.
  - `POST /predict`: Processes input and returns predictions.

---

## Deployment

### Deployment Using Azure Container Registry and Docker

This section outlines the steps to deploy the Flask application using Docker and Azure Container Registry (ACR).

#### Prerequisites
1. An active Azure account.
2. Azure CLI installed on your local machine.
3. Docker installed and running on your local machine.

#### Steps for Deployment

1. **Create a Dockerfile**:
   Ensure your project has a `Dockerfile` at the root level. Below is an example:
   ```dockerfile
   FROM python:3.9-slim

   # Set the working directory
   WORKDIR /app

   # Copy project files to the container
   COPY . /app

   # Install dependencies
   RUN pip install --no-cache-dir -r requirements.txt

   # Expose the application port
   EXPOSE 5000

   # Define the command to run the application
   CMD ["python", "app.py"]
   ```

2. **Build the Docker Image**:
   ```bash
   docker build -t student-performance-app .
   ```

3. **Test the Docker Image Locally**:
   Run the container locally to ensure it works as expected.
   ```bash
   docker run -p 5000:5000 student-performance-app
   ```

4. **Login to Azure**:
   ```bash
   az login
   ```

5. **Create an Azure Container Registry**:
   Replace `<acr-name>` with your desired registry name.
   ```bash
   az acr create --resource-group <resource-group-name> --name <acr-name> --sku Basic
   ```

6. **Login to ACR**:
   ```bash
   az acr login --name <acr-name>
   ```

7. **Tag the Docker Image**:
   Replace `<acr-name>` and `<image-name>` accordingly.
   ```bash
   docker tag student-performance-app <acr-name>.azurecr.io/student-performance-app:latest
   ```

8. **Push the Image to ACR**:
   ```bash
   docker push <acr-name>.azurecr.io/student-performance-app:latest
   ```

9. **Deploy the Container**:
   Use Azure App Service or Azure Kubernetes Service (AKS) to deploy the container.
   - **Using Azure App Service**:
     ```bash
     az webapp create --resource-group <resource-group-name> --plan <app-service-plan> \
     --name <app-name> --deployment-container-image-name <acr-name>.azurecr.io/student-performance-app:latest
     ```

   - **Using Azure Kubernetes Service (AKS)**:
     Follow AKS setup and deployment instructions from Azure documentation.

10. **Access the Application**:
    After deployment, access the application using the provided URL or IP address.

---

## Future Enhancements
1. Add more predictors (e.g., socioeconomic status, school district).
2. Deploy the app on other cloud platforms (AWS, Heroku, etc.).
3. Improve UI design.
4. Implement user authentication for personalized predictions.

---

Feel free to contribute by creating pull requests or raising issues. Happy Coding!

