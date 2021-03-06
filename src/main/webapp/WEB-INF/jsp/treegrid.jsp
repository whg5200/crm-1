<%@ page language="java" pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <title>jQuery EasyUI</title>
    <%@ include file="mainHead.jsp" %>
    <script>
        $(function () {
            $('#test').treegrid({
                title: '修改网页',
                iconCls: 'icon-save',
                width: 573,
                height: 350,
                nowrap: false,
                rownumbers: true,
                animate: true,
                collapsible: true,
                url: 'treegrid_data.json',
                idField: 'id',
                treeField: 'code',
                frozenColumns: [[
                    {
                        title: '编码', field: 'code', width: 150,
                        formatter: function (value) {
                            return '<span style="color:red">' + value + '</span>';
                        }
                    }
                ]],
                columns: [[
                    {field: 'name', title: '名称', width: 120},
                    {field: 'role', title: '作用', width: 120, rowspan: 2},
                    {field: 'path', title: '路径', width: 150, rowspan: 2}
                ]],
                onBeforeLoad: function (row, param) {
                    if (row) {
                        $(this).treegrid('options').url = 'treegrid_subdata.json';
                    } else {
                        $(this).treegrid('options').url = 'treegrid_data.json';
                    }
                },
                onContextMenu: function (e, row) {
                    e.preventDefault();
                    $(this).treegrid('unselectAll');
                    $(this).treegrid('select', row.code);
                    $('#mm').menu('show', {
                        left: e.pageX,
                        top: e.pageY
                    });
                }
            });
        });


    </script>
</head>
<body>

<table id="test"></table>

<div id="mm" class="easyui-menu" style="width:600px;">
    <div onclick="append()">Append</div>
    <div onclick="remove()">Remove</div>
</div>
</body>
</html>