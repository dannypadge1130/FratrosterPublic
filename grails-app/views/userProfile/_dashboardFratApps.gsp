<div class="span9 main">
	<div class="banner">
    	<p class="bannerTitle">&#934;&#916;&#920; Apps</p> 
   	</div>
    <!--Begin Frat Apps Content-->
    <table class="table table-hover">
    	<thead>
        	<tr>
            	<th>Status</th>
                <th>Apps</th>
                <th>App Access</th>
                <th>&#934;&#916;&#920; Access</th>
          	</tr>
     	</thead>
        <tbody>
        	<tr>
            	<td><a href="#removeAppModal" role="button" class="btn btn-danger" data-toggle="modal">Remove</a></td>
                <td><img src="appImage"> Photos</td>
                <td>
	                <!--Global / Private App Options-->
	                <label class="radio inline">
	                	<input type="radio" name="optionsRadios1" id="optionsRadios1" value="option1"> Global
	               	</label>
	                <label class="radio inline">
	                	<input type="radio" name="optionsRadios1" id="optionsRadios1" value="option1" checked> Private
	                </label>
                </td>
                <td>
                	<a href="#myModal" role="button" class="btn" data-toggle="modal">Members</a>
                </td>
       		</tr>
            <tr>
            	<td><a href="#addAppModal" role="button" class="btn btn-primary" data-toggle="modal">Add App</a></td>
                <td><img src="appImage"> Finance</td>
                <td>
                	<!--Global / Private App Options-->
                  	<label class="radio inline">
                    	<input type="radio" name="optionsRadios2" id="optionsRadios2" value="option1"> Global
                  	</label>
                  	<label class="radio inline">
                		<input type="radio" name="optionsRadios2" id="optionsRadios2" value="option1" checked> Private
                	</label>
               	</td>
                <td>
                	<a href="#myModal" role="button" class="btn" data-toggle="modal">Members</a>
               	</td>
         	</tr>
            <tr>
            	<td><a href="#addAppModal" role="button" class="btn btn-primary" data-toggle="modal">Add App</a></td>
                <td><img src="appImage"> History</td>
                <td>
                	<!--Global / Private App Options-->
                  	<label class="radio inline">
                    	<input type="radio" name="optionsRadios3" id="optionsRadios3" value="option1" checked> Global
                  	</label>
                  	<label class="radio inline">
                    	<input type="radio" name="optionsRadios3" id="optionsRadios3" value="option1"> Private
              		</label>
              	</td>
                <td>
                	<a href="#myModal" role="button" class="btn" data-toggle="modal">Members</a>
              	</td>
        	</tr>
      	</tbody>
 	</table>
 </div>
 <!--Add App Modal-->
 <div id="addAppModal" class="modal hide" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
 	<div class="modal-header">
    	<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
        <h3 id="myModalLabel">Add App?</h3>
  	</div>
    <div class="modal-body">
    	<p>Are you sure you want to add this App?</p>
  	</div>
    <div class="modal-footer">
    	<button class="btn" data-dismiss="modal" aria-hidden="true">Close</button>
        <button class="btn btn-primary">Save changes</button>
  	</div>
</div>
<!--Remove App Modal-->
<div id="removeAppModal" class="modal hide" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-header">
    	<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
        <h3 id="myModalLabel">Remove App?</h3>
  	</div>
    <div class="modal-body">
    	<p>Are you sure you want to remove this App?</p>
   	</div>
    <div class="modal-footer">
    	<button class="btn" data-dismiss="modal" aria-hidden="true">Close</button>
        <button class="btn btn-primary">Save changes</button>
   	</div>
</div>
<!--Member Access Modal-->
	<div id="myModal" class="modal hide" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    	<div class="modal-header">
        	<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
        	<h3 id="myModalLabel">&#934;&#916;&#920; {Photos} App Access</h3> <input class="span2 pull-right" type="text" placeholder="Search Members">
      	</div>
   		<div class="modal-body">
        	<table class="table table-hover">
            <thead>
            	<tr>
                	<th>&#934;&#916;&#920; Member</th>
                  	<th>Permissions</th>
               	</tr>
        	</thead>
            <tbody>
            	<tr>
                	<td>
                    	<img class="userPhoto img-polaroid" src="img/userListing/userPhoto.jpeg">
                 	</td>
                	<td>
                  		<!--Global / Private App Options-->
                  		<label class="radio inline">
                    		<input type="radio" name="optionsRadiosApp1" id="optionsRadiosApp1" value="option1"> Hide
                  		</label>
                  		<label class="radio inline">
                    		<input type="radio" name="optionsRadiosApp1" id="optionsRadiosApp1" value="option2" checked> View
                  		</label>
                  		<label class="radio inline">
                    		<input type="radio" name="optionsRadiosApp1" id="optionsRadiosApp1" value="option2"> Modify
                  		</label>
                  	</td>
            	</tr>
         	</tbody>
     	</table>
 	</div>
    <div class="modal-footer">
    	<button class="btn" data-dismiss="modal" aria-hidden="true">Close</button>
        <button class="btn btn-primary">Save changes</button>
  	</div>
</div>