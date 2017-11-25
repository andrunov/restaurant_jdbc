/**
 * Class serves user_home.jsp
 * works with orders of specify user
 */

/*url for exchange JSON data between main form DataTable (id="ordersDT")
 *represents orders and server*/
var ajaxUrl = '/ajax/orders/';

/*url use only for create new Order*/
var ajaxUrlCreateNew = '/ajax/orders/create';

/*url for exchange JSON data between restaurant modal window DataTable (id="restaurantDT") and server*/
var ajaxRestaurantUrl = '/ajax/restaurants/';

/*url for exchange JSON data between menuList modal window DataTable (id="menuListDT") and server*/
var ajaxMenuListUrl = '/ajax/menuLists/byRestaurant/';

/*url for exchange JSON data between dishes modal window DataTable (id="dishDT") and server*/
var ajaxDishesUrl = '/ajax/dishes/byMenuList/';

/*url for link to orders_dishes.jsp*/
var goUserOrdersDetails = '/user_order_details/';

/*url for redirect to orders_dishes.jsp after POST method*/
var redirectOrderDetails = 'user_order_details';

/*variable links to main form DataTable represents orders in orders.jsp*/
var datatableApi;

/*variable links to DataTable represents dishes in dishes modal window (id="selectDishes")*/
var dishDTApi;

/*variable links to orders.edit resource bundle */
var editTitleKey ="orders.edit";

/*variable links to orders.add resource bundle */
var addTitleKey ="orders.add";

/*variable for save title for multiple use */
var lastRestaurantTitle;

/*variable for save current filter value*/
var currentFilterValue = "ALL";

/*function to update DataTable by data from server*/
function updateTable(statusKey) {
    var date = $('#dateTimeFilter').val();
    $.get(ajaxUrl + "?statusKey=" + statusKey + "&dateKey=" + date, updateTableByData);
    currentFilterValue = statusKey;
}

/*function to update DataTable by data from server
 * with filter by date of orders*/
function updateTableDateFilter(date) {
    $.get(ajaxUrl + "?statusKey=" + currentFilterValue + "&dateKey=" + date, updateTableByData);
}

/*DataTable represents orders in main form initialization*/
function ordersDataTableInit() {
    datatableApi = $('#ordersDT').DataTable({
        "ajax": {
            "url": ajaxUrl,
            "dataSrc": ""
        },
        "paging": false,
        "searching": false,
        "info": true,
        "columns": [
            /*add column with image depending of Status*/
            {
                "orderable": false,
                "data": "status",
                "render": function (data, type, row) {
                    if (type == 'display') {
                        if (data=== "ACCEPTED"){
                            return '<img  src="resources/pictures/accepted.png" />';
                        }
                        else if(data=== "PREPARING"){
                            return '<img  src="resources/pictures/preparing.png" />';
                        }
                        else if(data=== "READY"){
                            return '<img  src="resources/pictures/ready.png" />';
                        }
                        else {
                            return '<img  src="resources/pictures/finished.png" />';
                        }
                    }
                    return null;
                }
            },
            {
                "data": "dateTime",
                "render": function (date, type, row) {
                    if (type == 'display') {
                        return formatDate(date);
                    }
                    return date;
                }
            },
            {
                "data": "restaurant",
                "render": function (date, type, row) {
                    return (date.name +', '+ date.address);
                }
            },
            {
                "data": "totalPrice",
                "render": function (date, type, row) {
                    return date.toFixed(2);
                }
            },
            {
                "orderable": false,
                "defaultContent": "",
                "className": "dt-center",
                "render": executionsBtns
            }
        ],
        "order": [
            [
                0,
                "asc"
            ]
        ],
        /*customize row style depending of Status*/
        "createdRow": function (row, data, dataIndex) {
            if (data.status==="ACCEPTED") {
                $(row).addClass('accepted');
            }else if (data.status==="PREPARING") {
                $(row).addClass("preparing");
            }else if (data.status==="READY") {
                $(row).addClass("ready");
            }else if (data.status==="FINISHED") {
                $(row).addClass("finished");
            }
        },
        "initComplete": makeEditable
    });
}

/*DataTable represents restaurants in modal window initialization*/
function restaurantDataTableInit() {
    $('#restaurantDT').DataTable({
        "ajax": {
            "url": ajaxRestaurantUrl,
            "dataSrc": ""
        },
        "paging": false,
        "searching": false,
        "info": true,
        "columns": [
            {
                "data": "name"
            },
            {
                "data": "address"
            },
            {
                "orderable": false,
                "defaultContent": "",
                "className": "dt-center",
                "render": selectRestaurantBtn
            }
        ],
        "order": [
            [
                0,
                "asc"
            ]
        ],
        "createdRow": ""
    });
}

/*DataTable represents MenuLists in modal window initialization*/
function menuListDataTableInit(id) {
    $('#menuListDT').DataTable({
        "ajax": {
            "url": ajaxMenuListUrl + id + '&TRUE',
            "dataSrc": ""
        },
        "destroy": true,
        "paging": false,
        "searching": false,
        "info": true,
        "columns": [
            {
                "data": "description"
            },
            {
                "data": "dateTime",
                "render": function (date, type, row) {
                    if (type == 'display') {
                        return formatDate(date);
                    }
                    return date;
                }
            },
            {
                "orderable": false,
                "defaultContent": "",
                "className": "dt-center",
                "render": selectMenuListBtn
            }
        ],
        "order": [
            [
                0,
                "asc"
            ]
        ],
        "createdRow": ""
    });
}

/*DataTable represents dishes in modal window initialization*/
function dishDataTableInit(id) {
    dishDTApi = $('#dishDT').DataTable({
        "ajax": {
            "url": ajaxDishesUrl+id,
            "dataSrc": ""
        },
        "destroy": true,
        "paging": false,
        "searching": false,
        "info": true,
        "columns": [
            {
                "data": "description"
            },
            {
                "data": "price"
            },
            {
                'targets': 0,
                'searchable': false,
                'orderable': false,
                'width': '1%',
                'className': 'dt-body-center',
                'render': function (data, type, full, meta) {
                    return '<input type="checkbox">';
                }
            }
        ],
        "order": [
            [
                0,
                "asc"
            ]
        ]
    });
}

/*document.ready function*/
$(function () {

    /*set cross-page variable "ordersDishesPostRedirectUrl" as 'home' for return
     * to page user_home.jsp after call POST-method in orders_dishes.jsp */
    localStorage.setItem("ordersDishesPostRedirectUrl",'home');

    /*dataTables initialization*/
    ordersDataTableInit();
    restaurantDataTableInit();

    /*adjust Datetimepicker*/
    $.datetimepicker.setLocale(localeCode);
    $('#dateTime').datetimepicker({
        format: 'Y-m-d H:i'
    });
    $('#dateTimeFilter').datetimepicker({
        closeOnDateSelect: true,
        format: 'Y-m-d',
        timepicker: false,
        onChangeDateTime:function(dp,$input){
            updateTableDateFilter($input.val())
        }
    });
    /*add clear button to input field*/
    $('#dateTimeFilter').addClear({
        symbolClass: 'glyphicon glyphicon-remove',
        returnFocus: false,
        onClear: function () {
            updateTableDateFilter('');
        }
    });
});

/*function for draw manage buttons*/
function executionsBtns(data, type, row) {
    if (type == 'display') {
        if (row.status == 'ACCEPTED') {
            return '<div class="btn-group pull-left"><a class="btn btn-primary" onclick=location.href="' + goUserOrdersDetails + row.id + '&' + row.restaurant.id + '">' + i18n["common.details"] + '</a>' +
                '<a class="btn btn-danger" onclick="deleteRow(' + row.id + ',' + row.restaurant.id + ');">' + i18n["common.delete"] + '</a></div>';
        }
        else {
            return '<a class="btn btn-primary pull-left" onclick=location.href="' + goUserOrdersDetails + row.id + '&' + row.restaurant.id + '">' + i18n["common.details"] + '</a>';
        }
    }
}

/*function for begin procedure of order addition
 * 1-st step: open modal window of restaurant select*/
function addOrder() {
    $('#selectRestaurant').modal();
}

/*render function draw button for restaurant selection
 * and finish 1-st step of order addition procedure*/
function selectRestaurantBtn(data, type, row) {
    if (type == 'display') {
        restaurantTitle = row.name+", "+row.address;
        return '<a class="btn btn-primary" onclick="openMenuListWindow(' + row.id +',\''+ restaurantTitle +'\');">' + i18n["common.select"] +'</span></a>';
    }
}

/*function of 2-nd step of order addition
 * get restaurant by id from server and to memory it in server
 * open modal window for menu list selection
 * hide modal window of restaurant select*/
function openMenuListWindow(id,restaurantTitle) {

    /*set html titles*/
    $('#modalTitleRestaurant').html(restaurantTitle);
    lastRestaurantTitle = restaurantTitle;

    /*dataTable initialization*/
    menuListDataTableInit(id);

    /*open modal window for menu list selection
     * hide modal window of restaurant select*/
    $('#selectMenuList').modal();
    $('#selectRestaurant').modal('hide');
}

/*render function draw button for menuList selection
 * and finish 2-nd step of order addition procedure*/
function selectMenuListBtn(data, type, row) {
    if (type == 'display') {
        menuListTitle = row.description +", "+row.dateTime;
        return '<a class="btn btn-primary" onclick="openDishWindow('+row.id+',\''+menuListTitle+'\');">' + i18n["common.select"] +'</a>';
    }
}

/*function of 3-rd step of order addition
 * get menuList by id from server and to memory it in server
 * open modal window for dish selection
 * hide modal window of menuList select*/
function openDishWindow(id,menuListTitle) {

    /*set html titles*/
    $('#modalTitleRestaurant2').html(lastRestaurantTitle);
    $('#modalTitleMenuList').html(menuListTitle);

    //DataTable for dishes modal window initialisation
    dishDataTableInit(id);

    // Handle multiple choice checkbox of dishes
    $('#dishDT tbody').on('click', 'input[type="checkbox"]', function(e){
        var $row = $(this).closest('tr');
        if(this.checked){
            $row.addClass('selected');
        } else {
            $row.removeClass('selected');
        }
        e.stopPropagation();
    });

    /*open modal window for dish selection
     * hide modal window of menuList select*/
    $('#selectDishes').modal();
    $('#selectMenuList').modal('hide');
}

/*function finish 3-rd step of order addition procedure
 * send selected data to server fo create new order
 * and redirect to orders_dishes.jsp for 4-th step
 * of creation new order - specify dishes quantities*/
function complete() {
    $.ajax({
        type: "POST",
        url: ajaxUrlCreateNew,
        data: getRequestParam(dishDTApi.rows( '.selected' ).data() ),
        success: function () {
            $('#selectDishes').modal('hide');
            // updateTable();
            location.href = redirectOrderDetails;
        }
    });
}

/*function creates dishes id array and totalPrice for sending to server*/
function getRequestParam(arr) {
    var dishIds=[];
    var totalPrice = 0;
    for (var i = 0; i < arr.length; i++){
        dishIds.push(arr[i].id);
        totalPrice = totalPrice + arr[i].price;
    }
    return "dishIds=" + dishIds + "&totalPrice="+totalPrice.toFixed(2);
}

/*render function draw button for delete row*/
function renderDeleteBtn(data, type, row) {
    if (row.status=='ACCEPTED') {
        return '<a class="btn btn-danger pull-left" onclick="deleteRow(' + row.id + ',' + row.restaurant.id + ');">' +
                '<span class="glyphicon glyphicon-remove-circle"></span></a>';
    }
}

/*method to delete row
 * use in all forms*/
function deleteRow(id,restaurantId) {
    $.ajax({
        url: ajaxUrl + id +'&'+ restaurantId,
        type: 'DELETE',
        success: function () {
            updateTable(currentFilterValue);
        }
    });
}

