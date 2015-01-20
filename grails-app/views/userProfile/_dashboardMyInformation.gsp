<!--my-information-->
<div class="col-lg-6 col-md-6 col-sm-6">  
  <div class="main">
    <div class="banner">
      <p class="banner-title">My Information</p> 
    </div>
    <!--panel-group-->
    <div class="panel-group" id="accordion">
      <!--name-section-->
      <div class="panel panel-default">
        <div class="panel-heading">
          <h4 class="panel-title">
            <a data-toggle="collapse" data-parent="#accordion" href="#collapseOne">
              Name
            </a>
          </h4>
        </div>
        <div id="collapseOne" class="panel-collapse collapse in">
          <div class="panel-body">
            <g:formRemote name="updateNames" id="updateNames" onSuccess="successMessage()" update="updateNamesField" url="[controller:'userProfile', action:'updateName']">
              <div id="updateNamesField">
                <g:render template="/userProfile/dashboardUserName"/>
              </div>
            <button type="submit" class="btn btn-primary" onclick='$("#updateNames").submit();'>Update Name</button>
            </g:formRemote>                                                                             
          </div>
        </div>
      </div>
      <!--/name-section-->
      <!--/email-section-->
      <div class="panel panel-default">
        <div class="panel-heading">
          <h4 class="panel-title">
            <a data-toggle="collapse" data-parent="#accordion" href="#collapseTwo">
              Email
            </a>
          </h4>
        </div>
        <div id="collapseTwo" class="panel-collapse collapse">
          <div class="panel-body">
            <g:formRemote name="updateEmail" id="updateEmail" onSuccess="successMessage()" update="updateEmailField" url="[controller:'userProfile', action:'updateEmail']">
              <div id="updateEmailField">
                <g:render template="/userProfile/dashboardEmail"/>
              </div>
            </g:formRemote> 
            <button type="submit" class="btn btn-primary" onclick='$("#updateEmail").submit();'>Update Email</button>              
          </div>
        </div>
      </div>
      <!--/email-section-->
      <!--password-section-->
      <div class="panel panel-default">
        <div class="panel-heading">
          <h4 class="panel-title">
            <a data-toggle="collapse" data-parent="#accordion" href="#collapseThree">
              Password
            </a>
          </h4>
        </div>
        <div id="collapseThree" class="panel-collapse collapse">
          <div class="panel-body">
            <form role="form">
              <div class="form-group">                        
                <input type="password" class="form-control" id="exampleInputPassword1" placeholder="Current Password">
              </div>                      
              <div class="form-group">                        
                <input type="password" class="form-control" id="exampleInputPassword1" placeholder="New Password">
              </div>                      
              <div class="form-group">                        
                <input type="password" class="form-control" id="exampleInputPassword1" placeholder="Re-type New Password">
              </div>
              <button type="submit" class="btn btn-primary">Change</button>
            </form>                 
          </div>
        </div>
      </div>
      <!--/password-section-->
    </div>                       
    <!--panel-group-->
  </div>
  <!--/main-->
</div>
<!--/my-information-->