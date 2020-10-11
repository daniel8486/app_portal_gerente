class Pages::PaymentController < PagesController

def index
 
    if 
    @users = User.where(acesso: "#{session[:username]}") 
    #@users = User.where(password: "#{session[:password]}")
    unless @users.detect do |user_two|
      session[:username] == user_two.acesso
      @users = user_two
      flash[:notice] = 'USUÁRIO VALIDADO ...!'
    #end
    
    #puts "#{session[:username].present?}"
      

    end
    end # fim da procura se existe ou nao 

  @users = User.where(acesso: "#{session[:username]}")

  @users.detect do |user|
    session[:username] == user.acesso  
     @user = user
     puts "#{user.chapa}"
  end
   
    if params[:commit].to_s == "Enviar"
     enviarDados(params[:mes],params[:ano]) 
      request[:ano] = params[:ano]
      request[:mes] = params[:mes]
    else
     flash[:info] = "Código/Usuário: #{session[:username]} , 
     na inatividade de 10 Minutos, será necessário renovar a sessão !" 
    end
     
end


def enviarDados(ano,mes)

  client = Savon.client(
    :wsdl => 'http://187.125.24.178:8052/wsReport/MEX?wsdl',
    :endpoint => 'http://187.125.24.178:8052/wsReport/IwsReport',
    :namespace => 'http://www.totvs.com/',
    basic_auth:["4456","040113"],
    headers: {
      "Authorization" => 'Basic NDQ1NjowNDAxMTM=', 
      "Connection" => 'Keep-Alive', 
      "Accept-Encoding" => "gzip,deflate", 
      "Content-Type" => "text/xml;charset=utf-8",
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
    "id" => '194',
    "filters" =>'<?xml version="1.0" encoding="utf-16"?>
    <ArrayOfRptFilterReportPar xmlns:i="http://www.w3.org/2001/XMLSchema-instance" xmlns="http://www.totvs.com.br/RM/">
      <RptFilterReportPar>
        <BandName>RptReport</BandName>
        <FiltersByTable />
        <MainFilter>true</MainFilter>
        <Value></Value>
      </RptFilterReportPar>
    </ArrayOfRptFilterReportPar>',
    "parameters" => '<?xml version="1.0" encoding="utf-16"?>
    <ArrayOfRptParameterReportPar xmlns:i="http://www.w3.org/2001/XMLSchema-instance" xmlns="http://www.totvs.com.br/RM/">
      <RptParameterReportPar>
        <Description></Description>
        <ParamName>CHAPA</ParamName>
        <Type xmlns:d3p1="http://schemas.datacontract.org/2004/07/System" xmlns:d3p2="-mscorlib, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089-System-System.RuntimeType" i:type="d3p2:RuntimeType" xmlns:d3p3="-mscorlib, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089-System-System.UnitySerializationHolder" z:FactoryType="d3p3:UnitySerializationHolder" xmlns:z="http://schemas.microsoft.com/2003/10/Serialization/">
          <Data xmlns:d4p1="http://www.w3.org/2001/XMLSchema" i:type="d4p1:string" xmlns="">System.String</Data>
          <UnityType xmlns:d4p1="http://www.w3.org/2001/XMLSchema" i:type="d4p1:int" xmlns="">4</UnityType>
          <AssemblyName xmlns:d4p1="http://www.w3.org/2001/XMLSchema" i:type="d4p1:string" xmlns="">mscorlib, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089</AssemblyName>
        </Type>
        <Value xmlns:d3p1="http://www.w3.org/2001/XMLSchema" i:type="d3p1:string">'+@user.chapa+'</Value>
        <Visible>true</Visible>
      </RptParameterReportPar>
      <RptParameterReportPar>
        <Description></Description>
        <ParamName>CODCOLIGADA</ParamName>
        <Type xmlns:d3p1="http://schemas.datacontract.org/2004/07/System" xmlns:d3p2="-mscorlib, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089-System-System.RuntimeType" i:type="d3p2:RuntimeType" xmlns:d3p3="-mscorlib, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089-System-System.UnitySerializationHolder" z:FactoryType="d3p3:UnitySerializationHolder" xmlns:z="http://schemas.microsoft.com/2003/10/Serialization/">
          <Data xmlns:d4p1="http://www.w3.org/2001/XMLSchema" i:type="d4p1:string" xmlns="">System.String</Data>
          <UnityType xmlns:d4p1="http://www.w3.org/2001/XMLSchema" i:type="d4p1:int" xmlns="">4</UnityType>
          <AssemblyName xmlns:d4p1="http://www.w3.org/2001/XMLSchema" i:type="d4p1:string" xmlns="">mscorlib, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089</AssemblyName>
        </Type>
        <Value xmlns:d3p1="http://www.w3.org/2001/XMLSchema" i:type="d3p1:string">1</Value>
        <Visible>true</Visible>
      </RptParameterReportPar>
      <RptParameterReportPar>
        <Description></Description>
        <ParamName>NROPERIODO</ParamName>
        <Type xmlns:d3p1="http://schemas.datacontract.org/2004/07/System" xmlns:d3p2="-mscorlib, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089-System-System.RuntimeType" i:type="d3p2:RuntimeType" xmlns:d3p3="-mscorlib, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089-System-System.UnitySerializationHolder" z:FactoryType="d3p3:UnitySerializationHolder" xmlns:z="http://schemas.microsoft.com/2003/10/Serialization/">
          <Data xmlns:d4p1="http://www.w3.org/2001/XMLSchema" i:type="d4p1:string" xmlns="">System.String</Data>
          <UnityType xmlns:d4p1="http://www.w3.org/2001/XMLSchema" i:type="d4p1:int" xmlns="">4</UnityType>
          <AssemblyName xmlns:d4p1="http://www.w3.org/2001/XMLSchema" i:type="d4p1:string" xmlns="">mscorlib, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089</AssemblyName>
        </Type>
        <Value xmlns:d3p1="http://www.w3.org/2001/XMLSchema" i:type="d3p1:string">2</Value>
        <Visible>true</Visible>
      </RptParameterReportPar>
      <RptParameterReportPar>
        <Description></Description>
        <ParamName>MESCOMP</ParamName>
        <Type xmlns:d3p1="http://schemas.datacontract.org/2004/07/System" xmlns:d3p2="-mscorlib, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089-System-System.RuntimeType" i:type="d3p2:RuntimeType" xmlns:d3p3="-mscorlib, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089-System-System.UnitySerializationHolder" z:FactoryType="d3p3:UnitySerializationHolder" xmlns:z="http://schemas.microsoft.com/2003/10/Serialization/">
          <Data xmlns:d4p1="http://www.w3.org/2001/XMLSchema" i:type="d4p1:string" xmlns="">System.String</Data>
          <UnityType xmlns:d4p1="http://www.w3.org/2001/XMLSchema" i:type="d4p1:int" xmlns="">4</UnityType>
          <AssemblyName xmlns:d4p1="http://www.w3.org/2001/XMLSchema" i:type="d4p1:string" xmlns="">mscorlib, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089</AssemblyName>
        </Type>
        <Value xmlns:d3p1="http://www.w3.org/2001/XMLSchema" i:type="d3p1:string">'+request[:mes]+'</Value>
        <Visible>true</Visible>
      </RptParameterReportPar>
      <RptParameterReportPar>
        <Description></Description>
        <ParamName>ANOCOMP</ParamName>
        <Type xmlns:d3p1="http://schemas.datacontract.org/2004/07/System" xmlns:d3p2="-mscorlib, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089-System-System.RuntimeType" i:type="d3p2:RuntimeType" xmlns:d3p3="-mscorlib, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089-System-System.UnitySerializationHolder" z:FactoryType="d3p3:UnitySerializationHolder" xmlns:z="http://schemas.microsoft.com/2003/10/Serialization/">
          <Data xmlns:d4p1="http://www.w3.org/2001/XMLSchema" i:type="d4p1:string" xmlns="">System.String</Data>
          <UnityType xmlns:d4p1="http://www.w3.org/2001/XMLSchema" i:type="d4p1:int" xmlns="">4</UnityType>
          <AssemblyName xmlns:d4p1="http://www.w3.org/2001/XMLSchema" i:type="d4p1:string" xmlns="">mscorlib, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089</AssemblyName>
        </Type>
        <Value xmlns:d3p1="http://www.w3.org/2001/XMLSchema" i:type="d3p1:string">'+request[:ano]+'</Value>
        <Visible>true</Visible>
      </RptParameterReportPar>
    </ArrayOfRptParameterReportPar>',
    "fileName" => 'report.pdf',
}

response = client.call(
    :generate_report,
    message: message
    
)

#p response.soap_fault?

result_one = response.body[:generate_report_response][:generate_report_result]

size(result_one)

#doc = Nokogiri::Slop(result)

#@result = doc.NewDataSet.Resultado

rescue Exception => e 
 
e.message


end


def size(result_one)

  client = Savon.client(
   :wsdl => 'http://187.125.24.178:8052/wsReport/MEX?wsdl',
   :endpoint => 'http://187.125.24.178:8052/wsReport/IwsReport',
   :namespace => 'http://www.totvs.com/',
   basic_auth:["4456","040113"],
   headers: {
      "Authorization" => 'Basic NDQ1NjowNDAxMTM=', 
      "Connection" => 'Keep-Alive' , 
      "Accept-Encoding" => "gzip,deflate", 
      "Content-Type" => "text/xml;charset=utf-8",
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
    'guid' => "#{result_one}",
}

response = client.call(
    :get_generated_report_size,
    message: message
    
)

#p response.soap_fault?

result_two = response.body[:get_generated_report_size_response][:get_generated_report_size_result]

chunk(result_one,result_two)

#.Base64.encode64(results)



end

def chunk(result_one,result_two)

  client = Savon.client(
    :wsdl => 'http://187.125.24.178:8052/wsReport/MEX?wsdl',
    :endpoint => 'http://187.125.24.178:8052/wsReport/IwsReport',
    :namespace => 'http://www.totvs.com/',
    basic_auth:["4456","040113"],
    headers: {
      "Authorization" => 'Basic NDQ1NjowNDAxMTM=', 
      "Connection" => 'Keep-Alive' , 
      "Accept-Encoding" => "gzip,deflate", 
      "Content-Type" => "text/xml;charset=utf-8",
    },
    
   element_form_default: :qualified,
    :log => true,
    :pretty_print_xml => true,
    ssl_verify_mode: :none,
    log_level: :debug, 
    :raise_errors => true,
  )

  message = {
    'guid' => "#{result_one}",
    'offset' => '0',
    'length' => "#{result_two}",
}

response = client.call(
    :get_file_chunk,
    message: message
    
)

 results = response.body[:get_file_chunk_response][:get_file_chunk_result]

 export(results)

 

end


def export(results)
  @results = results 

  Base64.decode64(@results).to_s
  
end

#private
# Use callbacks to share common setup or constraints between actions.
def set_users
  @user= User.find(params[:id])
end

# Only allow a list of trusted parameters through.
def users_params
  params.permit(:acesso,:chapa,:password)
end 

end
end
