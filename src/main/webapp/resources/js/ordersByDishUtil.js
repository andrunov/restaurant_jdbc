/**
 * Class serves orders_by_dish.jsp
 * works with orders of specify dish
 */

/*url for exchange JSON data between DataTable and server*/
var ajaxUrl = '/ajax/order_by_dish/';

/*url for exchange JSON data between DataTable and server, using filter by status*/
var ajaxUrlWithFilter = '/ajax/order_by_dish/filterByStatus/';

/*variable links to orders.edit resource bundle */
var editTitleKey ="orders.edit";

/*url for link to orders_dishes.jsp*/
var goOrdersDishes = '/orders_dishes_by_user/';

/*url for link to orders.jsp*/
var goOrders = '/orders/';

/*variable links to DataTable represents orders in orders_by_dish.jsp*/
var datatableApi;

/*variable for save current filter value*/
var currentFilterValue = "ALL";

/*function to update DataTable by data from server
 * with filter by status of orders*/
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

/*document.ready function*/
$(function () {
    
    /*set cross-page variable "ordersDishesPostRedirectUrl" as 'orders_by_dish' for return
     * to this page (orders_by_dish.jsp) after call POST-method in orders_dishes.jsp */
    localStorage.setItem("ordersDishesPostRedirectUrl",'orders_by_dish');

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
                "data": "user",
                "render": function (date, type, row) {
                    return '<a href="' + goOrders + date.id + '">' + date.name + '</a>';
                }
            },
            {
                "data": "user",
                "render": function (data, type, row) {
                    if (type == 'display') {
                        return '<a href="mailto:' + data.email + '">' + data.email + '</a>';
                    }
                    return data.email;
                }
            },
            {
                "data": "restaurant",
                "visible": false
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
        "createdRow": "",
        "initComplete": makeEditable
    });

    /*adjust Datetimepicker*/
    $.datetimepicker.setLocale(localeCode);

    /*set field with datetimepicker*/
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
        return '<div class="btn-group pull-left"><a class="btn btn-primary" onclick=location.href="' + goOrdersDishes + row.id + '&' + row.user.id + '">' + i18n["common.details"] + '</a>' +
            '<a class="btn btn-success" onclick="updateRow(' + row.id + ',' + row.user.id + ');">' + i18n["common.status"] + '</a>' +
            '<a class="btn btn-danger" onclick="deleteRow(' + row.id + ','+ row.user.id + ',' + row.restaurant.id + ');">' + i18n["common.delete"] + '</a></div>';
    }
}

/*method to update row with new DataTime and Status*/
function updateRow(id,userId) {
    //fill modal form with data and open it
    $('#modalTitle').html(i18n[editTitleKey]);
    $.get(ajaxUrl + id+'&'+userId, function (data) {
        $.each(data, function (key, value) {
            if (key === "status") {
                $("#" + value).click();
            }else {
                $('#detailsForm').find("input[name='" + key + "']").val(
                    key === "dateTime" ? formatDate(value) : value
                );
            }
        });
        $('#editRow').modal();
    });
}

/*method to delete row
 * use in all forms*/
function deleteRow(id,userId,restaurantId) {
    $.ajax({
        url: ajaxUrl + id +'&'+userId + '&'+ restaurantId,
        type: 'DELETE',
        success: function () {
            updateTable(currentFilterValue);
        }
    });
}