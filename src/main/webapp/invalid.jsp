<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="refresh" content="5;url=http://localhost:3125/Hostel0.1/home.jsp">
<title>invalid</title>
</head>

<style>
/* General body styling */
body {
    font-family: 'Arial', sans-serif;
    background: linear-gradient(135deg, rgba(255, 99, 71, 0.9), rgba(255, 165, 0, 0.7), rgba(255, 0, 150, 0.8), rgba(0, 204, 255, 0.6)); /* Multi-color gradient */
    background-size: 400% 400%;
    animation: gradientAnimation 10s ease infinite; /* Animated gradient */
    display: flex;
    justify-content: center;
    align-items: center;
    height: 100vh;
    margin: 0;
    animation: fadeIn 1.5s ease-in-out; /* Fade-in animation for the page */
}

/* Animation for fade-in effect */
@keyframes fadeIn {
    0% {
        opacity: 0;
    }
    100% {
        opacity: 1;
    }
}

/* Animation for the gradient shift */
@keyframes gradientAnimation {
    0% {
        background-position: 0% 50%;
    }
    50% {
        background-position: 100% 50%;
    }
    100% {
        background-position: 0% 50%;
    }
}

/* Container for the message box */
.message-box {
    background-color: rgba(255, 255, 255, 0.9); /* Slight transparency for the message box */
    border-radius: 12px;
    border: 1px solid #ccc;
    box-shadow: 0 12px 30px rgba(0, 0, 0, 0.1); /* Deeper shadow for better depth */
    padding: 30px;
    text-align: center;
    max-width: 400px;
    width: 100%;
    transform: scale(0.98);
    animation: scaleUp 0.5s ease-in-out forwards; /* Animation for the message box scaling */
}

/* Animation for scaling up message box */
@keyframes scaleUp {
    0% {
        transform: scale(0.9);
    }
    100% {
        transform: scale(1);
    }
}

/* Title of the message box */
.message-box h2 {
    color: #ff4747;
    font-size: 26px;
    margin-bottom: 15px;
    font-weight: bold;
}

/* Message text styling */
.message-box p {
    font-size: 18px;
    color: #444;
    margin-bottom: 20px;
    line-height: 1.5;
}

/* Button styling */
.btn {
    background-color: #ff4747;
    color: white;
    border: none;
    padding: 12px 25px;
    border-radius: 30px;
    cursor: pointer;
    font-size: 18px;
    transition: background-color 0.3s, transform 0.3s ease-in-out;
    box-shadow: 0 4px 10px rgba(0, 0, 0, 0.2);
}

/* Button hover effect */
.btn:hover {
    background-color: #e03e3e;
    transform: scale(1.05); /* Slightly scale up on hover */
    box-shadow: 0 6px 14px rgba(0, 0, 0, 0.3); /* Enhanced shadow on hover */
}

/* Optional: center the page content vertically */
.container {
    display: flex;
    justify-content: center;
    align-items: center;
    min-height: 100vh;
}

</style>

<body>
<form action ="login.jsp" method = "post"> 
    <div class="container">
        <div class="message-box">
            <h2>Username and ID Incorrect</h2>
            <p>The username and/or ID you entered does not match our records. Please check your details and try again.</p>
            <button class="btn">Retry</button>
        </div>
    </div>
</form>
</body>
</html>