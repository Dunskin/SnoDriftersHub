<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EventTest.aspx.cs" Inherits="SnoDrifters.EventTest" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
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
    <script src="js/socialfeeds.js"></script>
    <link href='http://fonts.googleapis.com/css?family=Raleway:500,600,700,100,800,900,400,200,300' rel='stylesheet' type='text/css'>
    <link href='http://fonts.googleapis.com/css?family=Playball' rel='stylesheet' type='text/css'>
    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
    <!--Events Scripts and CSS -->
     <link href="events.css" rel="stylesheet" />
     <link href="style.css" rel="stylesheet" type="text/css" />

     <script src="js/event.js"></script>
     <script src="js/jquery.flexisel.js" type="text/javascript"></script>
     <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
     <script src="js/jquery.flexisel.js" type="text/javascript"></script>
     <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
     <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
     <script type="text/javascript" src="http://code.jquery.com/jquery-1.7.1.min.js"></script>
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
    </form>
</body>
</html>
