<#import "/lib/utils.ftl" as lib>

<#assign docsUrl = "https://docs.camunda.org/manual/${docsVersion}">
{
  "openapi": "3.0.2",
  "info": {
    "title": "Camunda Platform REST API",
    "description": "OpenApi Spec for Camunda Platform REST API.",
    "version": "${cambpmVersion}",
    "license": {
      "name": "Apache License 2.0",
      "url": "http://www.apache.org/licenses/LICENSE-2.0.html"
    }
  },
  "externalDocs": {
    "description": "Find out more about Camunda Rest API",
    "url": "${docsUrl}/reference/rest/overview/"
  },
  "servers": [

  <@lib.server
      url = "http://{host}:{port}/{contextPath}"
      variables = {"host": "localhost", "port": "8080", "contextPath": "engine-rest"}
      desc = "The API server for the default process engine" />

  <@lib.server
      url = "http://{host}:{port}/{contextPath}/engine/{engineName}"
      variables = {"host": "localhost", "port": "8080", "contextPath": "engine-rest", "engineName": "default"}
      desc = "The API server for a named process engine"
      last = true />

  ],
  "tags": [
    {"name": "Batch"},
    {"name": "Condition"},
    {"name": "Decision Definition"},
    {"name": "Deployment"},
    {"name": "Engine"},
    {"name": "Event Subscription"},
    {"name": "Execution"},
    {"name": "External Task"},
    {"name": "Group"},
    {"name": "Historic Activity Instance"},
    {"name": "Historic Process Instance"},
    {"name": "Identity"},
    {"name": "Incident"},
    {"name": "Job"},
    {"name": "Message"},
    {"name": "Metrics"},
    {"name": "Process Definition"},
    {"name": "Process Instance"},
    {"name": "Signal"},
    {"name": "Schema Log"},
    {"name": "Task"},
    {"name": "Task Attachment"},
    {"name": "Task Comment"},
    {"name": "Task Identity Link"},
    {"name": "Task Local Variable"},
    {"name": "Task Variable"},
    {"name": "Telemetry"},
    {"name": "Tenant"},
    {"name": "User"},
    {"name": "Variable Instance"},
    {"name": "Version"}
  ],
  "paths": {

    <#list endpoints as path, methods>
        "${path}": {
            <#list methods as method>
                "${method}":
                <#include "/paths${path}/${method}.ftl"><#sep>,
            </#list>
        }<#sep>,
    </#list>

  },
  "components": {
    "schemas": {

    <#list models as name, package>
        "${name}": <#include "/models/${package}/${name}.ftl"><#sep>,
    </#list>

    }
  }
}
