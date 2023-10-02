# INTRODUCTION

This is Azure Function App code for various automations.

## How to Create an Azure Function App

1. Press `Ctrl + Shift + P` for Command Pallete.
2. Search for `Create Function App in Azure`. Make sure you have installed `ms-azuretools.vscode-azurefunctions` extension.
3. Follow the process and it will create a function app for you in Azure.
4. Once done, create a Managed Identity under the Function App. It will be a System Assigned Managed Identiy.
5. Assign Subscription level `Contributor` access to this Managed Identity.
7. You are now read to deploy this function to the function app. Again open command pallete using `Ctrl + Shify + P` and search for `Deploy to Function App` and click on it.
8. It will show you all function apps, make sure you select right one and rest will be taken care by VS Code for you.
