<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SnoDrifters.aspx.cs" Inherits="SnoDrifters.SnoDrifters" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <!-- Basic Page Needs
    ================================================== -->
    <meta charset="utf-8">
    <!--[if IE]><meta http-equiv="x-ua-compatible" content="IE=9" /><![endif]-->
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Sno-Drifters</title>
    <meta name="description" content="Your Description Here">
    <meta name="keywords" content="bootstrap themes, portfolio, responsive theme">
    <meta name="author" content="ThemeForces.Com">

    <!-- Favicons
    ================================================== -->
    <link rel="shortcut icon" href="img/favicon.ico" type="image/x-icon">
    <link rel="apple-touch-icon" href="img/apple-touch-icon.png">
    <link rel="apple-touch-icon" sizes="72x72" href="img/apple-touch-icon-72x72.png">
    <link rel="apple-touch-icon" sizes="114x114" href="img/apple-touch-icon-114x114.png">
    <!-- Bootstrap -->
    <link rel="stylesheet" type="text/css" href="css/bootstrap.css">
    <link rel="stylesheet" type="text/css" href="fonts/font-awesome/css/font-awesome.css">
        <!-- Stylesheet
    ================================================== -->
    <link rel="stylesheet" type="text/css" href="css/style.css">
    <link rel="stylesheet" type="text/css" href="css/responsive.css">
    <script type="text/javascript" src="js/modernizr.custom.js"></script>
    <link href='http://fonts.googleapis.com/css?family=Raleway:500,600,700,100,800,900,400,200,300' rel='stylesheet' type='text/css'>
    <link href='http://fonts.googleapis.com/css?family=Playball' rel='stylesheet' type='text/css'>
    <link href="css/editor.css" rel="stylesheet" />
    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->


    <!--Events stuff-->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
    <link href="css/events.css" rel="stylesheet" />
    <script src="js/event.js"></script>
    <script type="text/javascript" src="http://code.jquery.com/jquery-1.7.1.min.js"></script>
    <script src="js/jquery.flexisel.js" type="text/javascript"></script>
    <link href="style.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
    <link rel="stylesheet" href='https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css'
        media="screen" />
    <script type="text/javascript" src='https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js'></script>
    <script type="text/javascript">
        $(function () {
            $('#myCarousel').carousel();
        });
    </script>
     

</head>
  

<body>
    <form id="form1" runat="server">
    <div id="tf-home">
        <div class="overlay">
            <div id="sticky-anchor"></div>
            <nav id="tf-menu" class="navbar navbar-default">
                <div class="container">
                    <!-- Brand and toggle get grouped for better mobile display -->
                    <div class="navbar-header">
                        <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                            <span class="sr-only">Toggle navigation</span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                        </button>
                        <a class="navbar-brand logo" href="index.html"><img src="img/SnoDrifters/MJSNOWGUY_Logo.png" /></a>
                    </div>
                    <!-- Collect the nav links, forms, and other content for toggling -->
                    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                        <ul class="nav navbar-nav navbar-right">
                            <li><a href="#tf-home">Home</a></li>
                            <li><a href="#tf-events">Events</a></li>
                            <li><a href="#tf-gallery">Gallery</a></li>
                            <li><a href="#tf-sponsors">Sponsors</a></li>
                            <li><a href="#tf-clubinfo">Club Info</a></li>
                            <li><a href="#tf-contactus">Contact Us</a></li>
                        </ul>
                    </div><!-- /.navbar-collapse -->
                </div><!-- /.container-fluid -->
            </nav>
            <div class="container">
                <div class="content">
                    <h1>Moose Jaw Sno-Drifters</h1>                                        
                </div>
            </div>
        </div>
    </div>




<div id="tf-events">
    
<div id="myCarousel" class="carousel slide" data-ride="carousel" data-interval="false">  
    <!--Main Repeater -->
    <asp:Repeater ID= "rptMain" runat="server" OnItemDataBound="OnItemDataBound">  
        <ItemTemplate>
              <ol class="carousel-indicators" >
                    <asp:Repeater ID="rptIndicators" runat="server">
                        <ItemTemplate>
                            <li data-target="#myCarousel" data-slide-to='<%# Container.ItemIndex%>' class='<%# Container.ItemIndex == 0 ? "active" : "" %>'>
                           <%-- <%#Eval("Day")%>--%>
                            </li>
                        </ItemTemplate>
                    </asp:Repeater>
                </ol>
                <div class="carousel-inner" role="listbox">
                    <asp:Repeater ID="rptSlides" runat="server">
                        <ItemTemplate>
                            <div <%# Container.ItemIndex == 0 ? "class=\"item active\"" : "class=\"item\"" %>>
                                <div class="fill" background-image: url(./img/"+MediaLink+") <%#((EventsPic)Container.DataItem).RenderForCarousel()%>;">
                                <div class="carousel-caption d-none d-md-block">
                                    <h2><%#Eval("Title")%></h2>
                                    <h3><%#Eval("Month ")%><%#Eval("Day ")%><%#Eval("Year")%></h3>
                                    <small><%#Eval("Description ")%><%#Eval(" Location")%></small>
                                </div>
                            </div>
                        </ItemTemplate>
                    </asp:Repeater>
                </div>
            </ItemTemplate>
       

    </asp:Repeater>
               

         <!--Left and Right controls -->

<%--      <a class="left carousel-control" href="#myCarousel"  data-slide="prev">
            <span class="glyphicon glyphicon-chevron-left"></span>
                <span class="sr-only">Previous</span>
      </a>

        <a class="right carousel-control" href="#myCarousel" data-slide="next">
                <span class="glyphicon glyphicon-chevron-right"></span>
                <span class="sr-only">Next</span>
       </a>--%>
       </div>
    </div>


 <div class="container">
            <div class="section-title">
                <h3>Events</h3>
                <hr>
            </div>
            </div>

  <div class="container">
          
        <asp:Panel ID="eventsPanel" 
            runat="server" 
            GroupingText="Event Editor">
                         
                <asp:Label ID="lblDay" Text="Day:" AssociatedControlID="txtDay" runat="server" /> 
                <asp:TextBox ID="txtDay" runat="server" Width="100px"></asp:TextBox>

                <asp:Label ID="lblMonth" Text="Month:" AssociatedControlID="txtMonth" runat="server" /> 
                <asp:TextBox ID="txtMonth" runat="server" Width="100px"></asp:TextBox> 
               
                <asp:Label ID="lblYear" Text="Year:" AssociatedControlID="txtYear" runat="server" />
                <asp:TextBox ID ="txtYear" runat="server" Width="100px"></asp:TextBox> <br/>

                <asp:Label ID="lblTitle" Text="Events Title:" AssociatedControlID="txtEventTitle" runat="server" />
                <asp:TextBox ID="txtEventTitle" runat="server"></asp:TextBox> 
                <asp:RequiredFieldValidator ID="reqTextTitle" ControlToValidate="txtEventTitle" Text="(Required)" runat="server" /><br />

                <asp:Label ID="lblLocation" Text="Location:" AssociatedControlID="txtLocation" runat="server"  />
                <asp:TextBox ID="txtLocation" runat="server" TextMode="MultiLine" Width="100px" Height="47px"></asp:TextBox><br />
            
                <asp:Label ID="lblDescription" Text="Description:" AssociatedControlID="txtDescription" runat="server" />
                <asp:TextBox ID="txtDescription" runat="server" TextMode="MultiLine" Width="300px" Height="46px"></asp:TextBox> <br />

                <!--Upload Pic Event --> 
                <asp:Label ID="lblEventsImage" Text="Choose a Picture!"  runat="server" />
                <asp:FileUpload ID="imgEventPic" runat="server" Width="247px" Height="19px" />  <br />
                                               
               <!--Save Event --> 
               <asp:Button ID="btnSaveEvent" runat="server" OnClick="btnInsert_Click" Text="Add Event" Width="100px" /> 
                      
            
        </asp:Panel>
            
                </div>
  <div id="tf-gallery">
        <div class="container">
            <div class="section-title">
                <h3>Gallery</h3>
                <hr>
            </div>

       
         

<%--<asp:DataList ID="dtlalbums" runat="server" RepeatColumns = "5" RepeatDirection ="Horizontal" RepeatLayout="Flow">
    <ItemTemplate>
         
<asp:ImageButton ID="imgBtn" runat="server" ImageUrl='<%# "/img/" + Eval("Url") %>' Width="100px" Height="100px" 
  OnClick="imgBtn_Click" CommandArgument='<%# Container.ItemIndex %>' />
</ItemTemplate>
      
    
</asp:DataList> --%>
<%--<div class="space">
<asp:Button ID="lbnFirstPage" Text="First" CommandName="first" 
 OnCommand="Page_OnClick" runat="server" Width="125px" />
<asp:LinkButton ID="lbnPrevPage" Text="Prev" CommandName="prev" 
 OnCommand="Page_OnClick" runat="server" Width="125px" />
<asp:LinkButton ID="lbnNextPage" Text="Next" CommandName="next" 
 OnCommand="Page_OnClick" runat="server" Width="125px" />
<asp:LinkButton ID="lbnLastPage" Text="Last" CommandName="last" 
 OnCommand="Page_OnClick" runat="server" Width="125px" />
  </div>       --%>

                <div class="col-md-2">
                    <img src="img/09.jpg" class="img-responsive">
                </div>
                <div class="col-md-2">
                    <img src="img/02.jpg" class="img-responsive">
                </div>
                <div class="col-md-2">
                    <img src="img/03.jpg" class="img-responsive">
                </div>
                <div class="col-md-2">
                    <img src="img/03.jpg" class="img-responsive">
                </div>
                <div class="col-md-2">
                    <img src="img/02.jpg" class="img-responsive">
                </div>
                <div class="col-md-2">
                    <img src="img/09.jpg" class="img-responsive">
                </div>
            </div>
            <div class="row toppadding">
                <div class="col-md-2">
                    <img src="img/04.jpg" class="img-responsive">
                </div>
                <div class="col-md-2">
                    <img src="img/05.jpg" class="img-responsive">
                </div>
                <div class="col-md-2">
                    <img src="img/06.jpg" class="img-responsive">
                </div>
                <div class="col-md-2">
                    <img src="img/06.jpg" class="img-responsive">
                </div>
                <div class="col-md-2">
                    <img src="img/05.jpg" class="img-responsive">
                </div>
                <div class="col-md-2">
                    <img src="img/04.jpg" class="img-responsive">
                </div>
            </div>
            <ul class="pager">
                <li class="previous"><a href="#">Previous</a></li>
                <li class="next"><a href="#">Next</a></li>
            </ul>
        </div>
    </div>
   <div id="tf-sponsors">
        <div class="overlay">
            <div class="container">
                <div class="row">
                    <div class="col-md-6 col-md-offset-6">
                        <h3>Sponsors</h3>
                        <br>
                        <div class="row">
                            <div class="col-md-4">
                                <img src="img/09.jpg" class="img-responsive"/>
                            </div>
                            <div class="col-md-4">
                                <img src="img/02.jpg" class="img-responsive"/>
                            </div>
                            <div class="col-md-4">
                                <img src="img/03.jpg" class="img-responsive"/>
                            </div>                        
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div id="tf-clubinfo">
        <div class="overlay">
            <div class="container">
                <div class="row">
                    <div class="col-md-6">
                        <h3>Club Info</h3>
                        <br>
                        <ul class="list-inline why-me">
                            <li>
                                <h4> Mission Statement</h4>
                                <p>The Moose Jaw Sno-Drifters Snowmobile Club Inc. is an organization made up of citizens from Moose Jaw and the surrounding area.

We as a club promote safe, responsible snowmobiling by attending and hosting various community events. Our main goal is to raise funds to establish a groomed trail system.

A groomed trail system will provide a safe place to ride without any risk of damage to private and public property.
                                    <a href="Documents/Standard Operating Procedures.pdf" target ="_blank">Standard Operating Procedures</a>
                                    <a href="Documents/Club ByLaws.pdf" target ="_blank"> Club By-Laws</a>
                                </p>
                            </li>
                            <li>
                                <h4>Membership Types and Fees</h4>
                                <p>The membership fees of the Sno-Drifters will be set at the AGM.<br />
            •	Membership year will begin December 1st and expire on November 30th of each year.<br />    
                Eligibility for Membership - Any individual who is capable and who has attained the
            age of 16 and who is ordinarily a resident of 
            Moose Jaw & District, may apply for regular membership.
            •	Family Membership (2 votes, currently $30)<br />
            •	Single Membership (1 vote, currently $20)</p>
           </li>
           <li>
           <h4>Application Form To Join MJ Sno-Drifters </h4>
           <a href="Documents/Sno-Drifters Application Form.pdf" target ="_blank"> Sno-Drifters Application</a>
           </li>
            </ul>
                       
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div id="tf-contactus">
        <div class="container">
            <div class="section-title">
                <h3>Contact Us</h3>
                
                    <!--<ul class="social-media list-inline"><!-->
                        <a href="https://www.facebook.com/MooseJawSnoDrifters"><span class="fa fa-facebook"></span></a>
                        <a href="https://twitter.com/mjsnow15"><span class="fa fa-twitter"></span></a>
                        <a href="#"><span class="fa fa-youtube"></span></a>
                   
                 <h4>Mail Us!</h4>
                <p>Box 157-325 4th Ave. S.W.<br>
                  Moose Jaw, Saskatchewan, Canada<br />
                  S6H 5A2 <br />
                    <br />
                  Mjsnowmobileclub@gmail.com


                </p>
                <hr>
            </div>
            <div class="space"></div>
            <div class="row">
                <div class="col-md-6 col-md-offset-3">
                    <form id="contact">
                        <div class="form-group">
                            <input type="email" class="form-control" id="exampleInputEmail1" placeholder="Enter Name">
                        </div>
                        <div class="form-group">
                            <input type="password" class="form-control" id="exampleInputPassword1" placeholder="Enter Email">
                        </div>
                        <!--<div class="form-group">
                            <input type="email" class="form-control" id="exampleInputEmail1" placeholder="Enter Website">
                        </div>-->
                        <div class="form-group">
                            <textarea class="form-control" rows="4" placeholder="Message"></textarea>
                        </div>
                        <button type="submit" class="btn btn-primary my-btn dark">Submit</button>
                    </form>
                </div>
            </div>
        </div>
    </div>
    <nav id="tf-footer">
        <div class="container">     
              <div class="pull-right">
                <ul class="social-media list-inline">
                    <li><a href="#"><span class="fa fa-facebook"></span></a></li>
                    <li><a href="#"><span class="fa fa-twitter"></span></a></li>
                    <li><a href="#"><span class="fa fa-youtube"></span></a></li>                                      
                </ul>
            </div>       
            
        </div>
    </nav>

    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
    <script type="text/javascript" src="js/jquery.1.11.1.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script type="text/javascript" src="js/bootstrap.js"></script>
    <!-- Javascripts
    ================================================== -->
    <script type="text/javascript" src="js/main.js"></script>
          </form>
</body>
</html>