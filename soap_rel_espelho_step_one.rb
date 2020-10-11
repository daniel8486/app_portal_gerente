require 'savon'

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
  
   #puts client.operations

  message = {
    "codColigada" => '1',
    "idReport" => '162', 
  }

    response = client.call(
        :get_report_info,
        message: message
    )
    
    results = response.body[:get_report_info_response][:get_report_info_result]
    
    puts results