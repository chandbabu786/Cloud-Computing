
import com.xensource.xenapi.Connection;
import com.xensource.xenapi.Types;
import com.xensource.xenapi.VM;
import java.net.MalformedURLException;
import java.util.Set;
import org.apache.xmlrpc.XmlRpcException;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author Administrator
 */
public class Test {
    public static void main(String[] args) throws MalformedURLException, XmlRpcException, Types.SessionAuthenticationFailed, Types.XenAPIException {
        Connection C=new Connection("http://172.16.12.45","root","xenserver");
        Set<VM> S=VM.getAll(C);
        
        for (VM V : S)
        {
            if(!V.getIsATemplate(C))
                System.out.println("VM NAme:"+V.getNameLabel(C)+"VMUUID:"+V.getUuid(C));
        }
    }
    
}
