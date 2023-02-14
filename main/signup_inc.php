<?php 
    
    include("cons/config.php");
    use PHPMailer\PHPMailer\PHPMailer;
    use PHPMailer\PHPMailer\Exception;
    require '..\PHPMailer-master\src\Exception.php';
    require '..\PHPMailer-master\src\PHPMailer.php';
    require '..\PHPMailer-master\src\SMTP.php';
    
    $mail = new PHPMailer(TRUE);
    $code = rand(111111, 999999);
    
    if(isset($_POST['submit']))
    {
        $name = mysqli_real_escape_string($conn, $_POST['name']);
        $email = mysqli_real_escape_string($conn, $_POST['email']);
        $password = mysqli_real_escape_string($conn, $_POST['password']);
        $conf_password = mysqli_real_escape_string($conn, $_POST['conf_password']);
        $oauth_provider = "system";

        if(empty($name) || empty($email) || empty($password) || empty($conf_password))
        {
            header("location: signupPage.php?signupPage=empty");
        }
        else
        {
            if(preg_match("/^[a-zA-Z0-9._-]/", $name))
            {
                //filter_var($email, FILTER_VALIDATE_EMAIL)
                //preg_match("/^[a-zA-Z0-9._-]+@[a-zA-Z0-9-]+\.[a-zA-Z.]{2,5}$", $email)

                if(preg_match("/^[a-zA-Z0-9._-]+@[a-zA-Z0-9-]+\.[a-zA-Z.]{2,5}$/", $email))
                {
                    $sql = "SELECT * FROM userinfo WHERE user_email='$email'";
                    $result = mysqli_query($conn, $sql);
                    $resutlCheck = mysqli_num_rows($result);
    
                    if($resutlCheck > 0)
                    {
                        header("Location: signupPage.php?signupPage=usertaken");
                    }
                    else
                    {
                        if($password != $conf_password)
                        {
                            header("Location: signupPage.php?signupPage=invalidpassword");
                        }
                        else
                        {
                            //cretae token
                            $token = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890!@#$%^&*()/';
                            $token = str_shuffle($token);
                            $token = substr($token,0,10);

                            //Hashing the password
                            $hashedPwd = password_hash($password, PASSWORD_DEFAULT);
                            //Insert the user into the database
                                
                            $sql = "INSERT INTO userinfo (oauth_provider, user_name, user_email, user_password, token, created_date, mail_confirmation, one_time_password) VALUES ('$oauth_provider', '$name', '$email', '$hashedPwd', '$token', now(), 0, 0 )";
    
                            mysqli_query($conn, $sql);
                            
                            $req = "UPDATE userinfo SET one_time_password='$code' WHERE user_email='$email' AND token='$token' ";
                            mysqli_query($conn, $req);
                            header("location: mail_verify.php?email='$email'");
                        }
                    }
                }
                else
                {
                    header("location: signupPage.php?signupPage=invalidemail");
                }
            }
            else
            {
                header("location: signupPage.php?signupPage=invalidname");
            }
        }
    }
?>