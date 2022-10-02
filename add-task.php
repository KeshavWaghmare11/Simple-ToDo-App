<?php 
    include('config/constants.php');
?>

<html>
    <head>
        <title>Simple ToDo App</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-eOJMYsd53ii+scO/bJGFsiCZc+5NDVN2yr8+0RDqr0Ql0h+rP48ckxlpbzKgwra6" crossorigin="anonymous">
        <link rel="stylesheet" href="<?php echo SITEURL; ?>css/style.css" />
    </head>
    
    <body background="http://localhost/Simple-ToDo-App-main/image/img.jpg">
    
        <div class="wrapper">
         
        <div class="container">

            <div class="row">
            
                <div class="col-lg-2"></div>


            <div class="col-lg-8">

            <h1 class="text-center">Simple ToDo App</h1>

                <a class="btn-secondary" href="<?php echo SITEURL; ?>">Home</a>

                <center><h3>Add Task Page</h3></center>

                <p>
                    <?php 
                    
                        if(isset($_SESSION['add_fail']))
                        {
                            echo $_SESSION['add_fail'];
                            unset($_SESSION['add_fail']);
                        }
                    
                    ?>
                </p>
               
                <form method="POST" action="">
                    <div class="mb-3">
                      <label for="exampleInputEmail1" class="form-label"><b>Task Name</b></label>
                      <input type="text" name="task_name" class="form-control" placeholder="Type your Task Name" required="required" /></td>
                    </div>

                    <div class="mb-3">
                      <label for="exampleInputPassword1" class="form-label"><b>Task Description</b></label>
                      <textarea name="task_description" class="form-control" placeholder="Type Task Description" required="required"></textarea>
                    </div>

                    <div class="mb-3">
                        <label for="disabledSelect" class="form-label"><b>Task Progress or Status Type</b></label>
                      <select name="list_id" class="form-select" id="">
                        <?php 
                     
                        $conn = mysqli_connect(LOCALHOST, DB_USERNAME, DB_PASSWORD) or die(mysqli_error());
                        
                        $db_select = mysqli_select_db($conn, DB_NAME) or die(mysqli_error());
                        
                        $sql = "SELECT * FROM tbl_lists";
                        
                        $res = mysqli_query($conn, $sql);
                       
                        if($res==true)
                        {
                            $count_rows = mysqli_num_rows($res);
                            
                            
                            if($count_rows>0)
                            {
                                
                                while($row=mysqli_fetch_assoc($res))
                                {
                                    $list_id = $row['list_id'];
                                    $list_name = $row['list_name'];
                                    ?>
                                    <option value="<?php echo $list_id ?>"><?php echo $list_name; ?></option>
                                    <?php
                                }
                            }
                            else
                            {
                                ?>
                                <option value="0">None</option>p
                                <?php
                            }
                            
                        }
                    ?>
                      </select>
                    </div>

                    <div class="mb-3">
                        <label for="exampleInputPassword1" class="form-label"><b>Start Date</b></label>
                        <input type="date" class="form-control" name="start_date" required="required" />
                       
                      </div>

                      <div class="mb-3">
                        <label for="exampleInputPassword1" class="form-label"><b>Deadline </b></label>
                        <input type="date" class="form-control" name="deadline" required="required" />
                      </div>

                    <button type="submit" class="btn btn-secondary" name="submit">Add</button>
                </form>

            </div>

                <div class="col-lg-2"></div>
            
            
            </div>
        
        </div>
        
        </div>
    </body>
    
</html>


<?php 

    //Check whether the SAVE button is clicked or not
    if(isset($_POST['submit']))
    {
        //echo "Button Clicked";
        //Get all the Values from Form
        $task_name = $_POST['task_name'];
        $task_description = $_POST['task_description'];
        $list_id = $_POST['list_id'];
        $start_date = $_POST['start_date'];
        $deadline = $_POST['deadline'];
        
        //Connect Database
        $conn2 = mysqli_connect(LOCALHOST, DB_USERNAME, DB_PASSWORD) or die(mysqli_error());
        
        //SElect Database
        $db_select2 = mysqli_select_db($conn2, DB_NAME) or die(mysqli_error());
        
        //CReate SQL Query to INSERT DATA into DAtabase
        $sql2 = "INSERT INTO tbl_tasks SET 
            task_name = '$task_name',
            task_description = '$task_description',
            list_id = '$list_id',
            start_date = '$start_date',
            deadline = '$deadline'
        ";
        
        //Execute Query
        $res2 = mysqli_query($conn2, $sql2);
        
        //Check whetehre the query executed successfully or not
        if($res2==true)
        {
            //Query Executed and Task Inserted Successfully
            $_SESSION['add'] = "Task Added Successfully.";
            
            //Redirect to Homepage
            header('location:'.SITEURL);
            
        }
        else
        {
            //FAiled to Add TAsk
            $_SESSION['add_fail'] = "Failed to Add Task";
            //Redirect to Add TAsk Page
            header('location:'.SITEURL.'add-task.php');
        }
    }

?>




































