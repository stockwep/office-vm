# Deploy a Windows VM and install Office using MSI ISO.

<a href="https://portal.azure.com/#create/Microsoft.Template/uri/https%3A%2F%2Fraw.githubusercontent.com%2Fstockwep%2Foffice-vm%2Fmaster%2Fazuredeploy.json" target="_blank">
    <img src="http://azuredeploy.net/deploybutton.png"/>
</a>
<a href="https://portal.azure.us/#create/Microsoft.Template/uri/https%3A%2F%2Fraw.githubusercontent.com%2Fstockwep%2Foffice-vm%2Fmaster%2Fazuredeploy.json" target="_blank">
<img src="https://raw.githubusercontent.com/Azure/azure-quickstart-templates/master/1-CONTRIBUTION-GUIDE/images/deploytoazuregov.png"
</a>
<a href="http://armviz.io/#/?load=https%3A%2F%2Fraw.githubusercontent.com%2Fstockwep%2Foffice-vm%2Fmaster%2Fazuredeploy.json" target="_blank">
    <img src="http://armviz.io/visualizebutton.png"/>
</a>

Based on [201-vm-custom-script-windows](https://github.com/Azure/azure-quickstart-templates/tree/master/201-vm-custom-script-windows) template from [Azure Quick Start Templates](https://github.com/Azure/azure-quickstart-templates). This template allows you to deploy a Windows VM and install Office ProPlus using the ISO from MSDN. The Office ISO must be staged in Azure storage for use by the script.