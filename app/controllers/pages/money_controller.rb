class Pages::MoneyController < PagesController
  def index 
    @client = Savon.client(
      :wsdl => 'http://10.1.11.161/TOTVSBusinessConnect/wsDataServer.asmx?wsdl',
      # env_namespace: :soapenv,
      # element_form_default: :qualified,
      :log => true,
      :pretty_print_xml => true,
      basic_auth:["4456","040113"],
      ssl_verify_mode: :none,
      log_level: :debug, 
    )
  
    message = {
      'DataServerName' => 'FOPDATAHISTORICOSALARIALWINFORM' ,
      'Filtro' => "CODPESSOA="+session[:username]+"",
      'Contexto' => 'CODCOLIGADA=1;CODSISTEMA=G;CODUSUARIO=mestre;',
      'Usuario' => '4456',
      'Senha' => '040113',
    }  
  
    response = @client.call(
      :read_view_auth,
      message: message,
    )
  
    result = response.body[:read_view_auth_response][:read_view_auth_result] 
    
    doc = Nokogiri::Slop(result)
  
    @result = doc.NewDataSet.PFHSTSAL
 
    rescue Exception => e 
   
    e.message

   end


end
