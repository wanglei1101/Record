<#setting classic_compatible=true>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>User List</title>

    <!--<link rel="stylesheet" type="text/css" href="./styles.css">-->

</head>
<body>
<table width="1500" height="600" border="0" cellpadding="1" cellspacing="1">
    <tr>
        Nihao
            ${test.id}<br/>
            ${test.context}<br/>
            ${test.viewCount}

            <#-- <#list users as user>
             <tr>
               <td width="160" height="65" align="center"><span class="STYLE15">${user.id}</span></td>
               <td width="160" height="65" align="center"><span class="STYLE15">${user.userName}</span></td>
               <td width="160" height="65" align="center"><span class="STYLE15">${user.passWord}</span></td>
             </tr>
             </#list>-->
    </tr>
</table>
</body>
</html>
