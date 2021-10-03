package com.sulake.habbo.communication.messages.incoming.handshake
{
   import com.sulake.core.communication.messages.IMessageEvent;
   import com.sulake.core.communication.messages.MessageEvent;
   import com.sulake.habbo.communication.messages.parser.handshake.DisconnectReasonParser;
   
   public class DisconnectReasonEvent extends MessageEvent implements IMessageEvent
   {
      
      public static const const_1943:int = 0;
      
      public static const const_1605:int = 1;
      
      public static const const_1532:int = 2;
      
      public static const const_1920:int = 3;
      
      public static const const_1989:int = 4;
      
      public static const const_1934:int = 5;
      
      public static const const_1676:int = 10;
      
      public static const const_1967:int = 11;
      
      public static const const_1913:int = 12;
      
      public static const const_2003:int = 13;
      
      public static const const_1815:int = 16;
      
      public static const const_1897:int = 17;
      
      public static const const_1911:int = 18;
      
      public static const const_1866:int = 19;
      
      public static const const_1909:int = 20;
      
      public static const const_1854:int = 22;
      
      public static const const_2009:int = 23;
      
      public static const const_1890:int = 24;
      
      public static const const_1960:int = 25;
      
      public static const const_1825:int = 26;
      
      public static const const_1821:int = 27;
      
      public static const const_1814:int = 28;
      
      public static const const_1974:int = 29;
      
      public static const const_1852:int = 100;
      
      public static const const_1892:int = 101;
      
      public static const const_1919:int = 102;
      
      public static const const_1962:int = 103;
      
      public static const const_1916:int = 104;
      
      public static const const_1842:int = 105;
      
      public static const const_2026:int = 106;
      
      public static const const_1925:int = 107;
      
      public static const const_1855:int = 108;
      
      public static const const_2017:int = 109;
      
      public static const const_1863:int = 110;
      
      public static const const_2020:int = 111;
      
      public static const const_1972:int = 112;
      
      public static const const_1853:int = 113;
      
      public static const const_1932:int = 114;
      
      public static const const_1984:int = 115;
      
      public static const const_2019:int = 116;
      
      public static const const_1944:int = 117;
      
      public static const const_1887:int = 118;
      
      public static const const_1858:int = 119;
       
      
      public function DisconnectReasonEvent(param1:Function)
      {
         super(param1,DisconnectReasonParser);
      }
      
      public function get reason() : int
      {
         return (this.var_10 as DisconnectReasonParser).reason;
      }
      
      public function get reasonString() : String
      {
         switch(this.reason)
         {
            case const_1605:
            case const_1676:
               return "banned";
            case const_1532:
               return "concurrentlogin";
            default:
               return "logout";
         }
      }
   }
}
