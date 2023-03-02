<%@ Page Title="" Language="C#" MasterPageFile="~/adminhome.Master" AutoEventWireup="true" CodeBehind="home.aspx.cs" Inherits="TaskMS.home" %>

<%@ Register Assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" Namespace="System.Web.UI.DataVisualization.Charting" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="CSS/home.css" rel="stylesheet" />
    <style>
        .flex {
            -webkit-box-flex: 1;
            -ms-flex: 1 1 auto;
            flex: 1 1 auto
        }

        @media (max-width:991.98px) {
            .padding {
                padding: 1.5rem
            }
        }

        @media (max-width:767.98px) {
            .padding {
                padding: 1rem
            }
        }

        .padding {
            padding: 5rem
        }

        .card {
            background: #fff;
            border-width: 0;
            border-radius: .25rem;
            box-shadow: 0 1px 3px rgba(0, 0, 0, .05);
            margin-bottom: 1.5rem
        }

        .card {
            position: relative;
            display: flex;
            flex-direction: column;
            min-width: 0;
            word-wrap: break-word;
            background-color: #fff;
            background-clip: border-box;
            border: 1px solid rgba(19, 24, 44, .125);
            border-radius: .25rem
        }

        .card-header {
            padding: .75rem 1.25rem;
            margin-bottom: 0;
            background-color: rgba(19, 24, 44, .03);
            border-bottom: 1px solid rgba(19, 24, 44, .125)
        }

            .card-header:first-child {
                border-radius: calc(.25rem - 1px) calc(.25rem - 1px) 0 0
            }

        card-footer,
        .card-header {
            background-color: transparent;
            border-color: rgba(160, 175, 185, .15);
            background-clip: padding-box
        }

        canvas {
            background-color: aliceblue;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.3/jquery.min.js">
    </script>
    <script src="https://code.highcharts.com/highcharts.js"></script>
    <script src="https://code.highcharts.com/highcharts-3d.js"></script>
    <div class="container mt-3" style="margin-left: 200px;">
        <div class="row mt-3">
            <div class=" col-xl-3">
                <a href="adminempl.aspx" style="text-decoration: none">
                    <div class="card order-card" style="background-color: #D0D0D0">
                        <div class="card-block d-flex flex-column align-items-center">
                            <h5 style="color: black"><b>Tatol Employee </b></h5>
                            <img src="images/totalemp.png" width="80" height="80" />
                            <h5 style="color: black">
                                <br />
                                <asp:Label ID="totalemp" runat="server" Text=""></asp:Label></h5>
                        </div>
                    </div>
                </a>
            </div>
            <div class="col-xl-3">
                <a href="status.aspx" style="text-decoration: none">
                    <div class="card  order-card" style="background-color: #A5D8DD">
                        <div class="card-block d-flex flex-column align-items-center">
                            <h5 style="color: black"><b>Total Task</b></h5>
                            <img style="height: 80px; width: 80px" src="images/cto.png" />
                            <h5 style="color: black">
                                <br />
                                <asp:Label ID="totaltask" runat="server" Text=""></asp:Label></h5>
                        </div>
                    </div>
                </a>
            </div>
            <div class="col-xl-3">
                <asp:LinkButton Style="text-decoration: none" ID="LinkButton2" OnClick="LinkButton2_Click" runat="server">
                    <div class="card order-card" style="background-color: #7E909A">
                        <div class="card-block d-flex flex-column align-items-center">
                            <h5 style="color: black"><b>Inprocess Task</b></h5>
                            <img src="images/tt.png" style="height: 80px; width: 80px" />
                            <h5 style="color: black">
                                <br />
                                <asp:Label ID="taskinprocess" runat="server" Text=""></asp:Label></h5>
                        </div>
                    </div>
                </asp:LinkButton>
            </div>
            <div class=" col-xl-3">
                <asp:LinkButton ID="LinkButton1" Style="text-decoration: none" OnClick="LinkButton1_Click" runat="server">
                    <div class="card order-card" style="background-color: #DBAE58">
                        <div class="card-block d-flex flex-column align-items-center">
                            <h5 style="color: black"><b>Complete Task</b></h5>
                            <img src="images/tt.png" style="height: 80px; width: 80px" />
                            <h5 style="color: black">
                                <br />
                                <asp:Label ID="comptask" runat="server" Text="Label"></asp:Label>
                            </h5>
                        </div>
                    </div>
                </asp:LinkButton>
            </div>
        </div>

        <%-- <div class="page-content page-container" id="page-content">   --%>
        <div class="d-flex">
    <%--        <div class="card col-md-5">
                <div class="card-body">
                    <div class="chartjs-size-monitor" style="position: absolute; left: 0px; top: 0px; right: 0px; bottom: 0px; overflow: hidden; pointer-events: none; visibility: hidden; z-index: -1;">
                        <div class="chartjs-size-monitor-expand" style="position: absolute; left: 0; top: 0; right: 0; bottom: 0; overflow: hidden; pointer-events: none; visibility: hidden; z-index: -1;">
                            <div style="position: absolute; width: 1000000px; height: 1000000px; left: 0; top: 0"></div>
                        </div>
                        <div class="chartjs-size-monitor-shrink" style="position: absolute; left: 0; top: 0; right: 0; bottom: 0; overflow: hidden; pointer-events: none; visibility: hidden; z-index: -1;">
                            <div style="position: absolute; width: 200%; height: 200%; left: 0; top: 0"></div>
                        </div>
                    </div>
                    <canvas id="chart-line" width="220" height="200" class="chartjs-render-monitor" style="display: block; width: 320px; height: 400px;"></canvas>
                </div>
            </div>--%>
            <div class="card col-md-5" style="margin-left: 15px">
                <div id="container1"></div>
                <script src='https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.1.4/Chart.bundle.min.js'></script>
        </div>
        <div>
            <asp:HiddenField ID="asp1" runat="server" />
            <asp:HiddenField ID="php1" runat="server" />
            <asp:HiddenField ID="java1" runat="server" />
            <asp:HiddenField ID="designer1" runat="server" />
            <asp:HiddenField ID="nodejs1" runat="server" />
        </div>
       
        <script src='https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.1.4/Chart.bundle.min.js'></script>
        <script>
            var aspnet = parseInt(document.getElementById('<%=asp1.ClientID%>').value);
            var java = parseInt(document.getElementById('<%=java1.ClientID%>').value);
            var php = parseInt(document.getElementById('<%=php1.ClientID%>').value);
            var designer = parseInt(document.getElementById('<%=designer1.ClientID%>').value);
            var nodejs = parseInt(document.getElementById('<%=nodejs1.ClientID%>').value);
            $(document).ready(function () {
                var chart = {
                    type: 'pie',
                    options3d: {
                        enabled: true,
                        alpha: 45
                    }
                };
                var title = {
                    text: 'Department Employee '
                };
                //var subtitle = {
                //    text: 'Status'
                //};
                var plotOptions = {
                    pie: {
                        innerSize: 100,
                        depth: 50
                    }
                };
                var series = [{
                    name: '',
                    data: [
                        ['asp.net', aspnet],
                        ['java', java],
                        ['php', php],
                        ['designer', designer],
                        ['nodejs', nodejs],

                    ]
                }];
                var json = {};
                json.chart = chart;
                json.title = title;
                /* json.subtitle = subtitle;*/
                json.plotOptions = plotOptions;
                json.series = series;
                $('#container1').highcharts(json);
            });
        </script>
    </div>
</asp:Content>
