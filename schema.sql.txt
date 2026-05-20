CREATE DATABASE telecom_churn;
USE telecom_churn;


CREATE TABLE `customers` (
  `customerID` varchar(20) DEFAULT NULL,
  `gender` varchar(10) DEFAULT NULL,
  `SeniorCitizen` int DEFAULT NULL,
  `Partner` varchar(5) DEFAULT NULL,
  `Dependents` varchar(5) DEFAULT NULL,
  `tenure` int DEFAULT NULL,
  `PhoneService` varchar(5) DEFAULT NULL,
  `MultipleLines` varchar(20) DEFAULT NULL,
  `InternetService` varchar(20) DEFAULT NULL,
  `OnlineSecurity` varchar(20) DEFAULT NULL,
  `OnlineBackup` varchar(20) DEFAULT NULL,
  `DeviceProtection` varchar(20) DEFAULT NULL,
  `TechSupport` varchar(20) DEFAULT NULL,
  `StreamingTV` varchar(20) DEFAULT NULL,
  `StreamingMovies` varchar(20) DEFAULT NULL,
  `Contract` varchar(20) DEFAULT NULL,
  `PaperlessBilling` varchar(5) DEFAULT NULL,
  `PaymentMethod` varchar(50) DEFAULT NULL,
  `MonthlyCharges` float DEFAULT NULL,
  `TotalCharges` varchar(50) DEFAULT NULL,
  `Churn` varchar(5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;