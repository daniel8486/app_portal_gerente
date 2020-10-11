require 'savon'
require 'base64'

client = Savon.client(
    :wsdl => 'http://10.1.11.161:8051/wsReport/MEX?wsdl',
    :endpoint => 'http://10.1.11.161:8051/wsReport/IwsReport',
    :namespace => 'http://www.totvs.com/',
    basic_auth:["4456","040113"],
    headers: {
      "Authorization" => 'Basic NDQ1NjowNDAxMTM=', 
      "Connection" => 'Keep-Alive' , 
      "Accept-Encoding" => "gzip,deflate", 
      "Content-Type" => "text/xml; charset=utf-8",
    },
    element_form_default: :qualified,
    :log => true,
    :pretty_print_xml => true,
    ssl_verify_mode: :none,
    log_level: :debug, 
    :raise_errors => true,
  )

   #client.operations

  message = {
    "codColigada" => '1',
    "id" => '162',
    "string" =>'<![CDATA[<?xml version="1.0" encoding="utf-16"?>
    <ArrayOfRptFilterReportPar xmlns:i="http://www.w3.org/2001/XMLSchema-instance" xmlns="http://www.totvs.com.br/RM/">
      <RptFilterReportPar>
        <BandName>rptReport1</BandName>
        <FiltersByTable />
        <MainFilter>true</MainFilter>
        <Value>012519</Value>
      </RptFilterReportPar>
      <RptFilterReportPar>
        <BandName>Totais</BandName>
        <FiltersByTable>
          <RptFilterByTablePar>
            <Filter>TotaisBatidas.Valor &lt;&gt; 
    </Filter>
            <TableName>TotaisBatidas</TableName>
          </RptFilterByTablePar>
        </FiltersByTable>
        <MainFilter>false</MainFilter>
        <Value>(TotaisBatidas.Valor &lt;&gt; 
    )</Value>
      </RptFilterReportPar>
    </ArrayOfRptFilterReportPar>]]>',

}

response = client.call(
    :generate_report,
    message: message
    
)

#p response.soap_fault?

results = response.body[:generate_report_response][:generate_report_result]


#.Base64.encode64(results)

puts results