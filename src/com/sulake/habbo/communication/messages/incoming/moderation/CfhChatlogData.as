package com.sulake.habbo.communication.messages.incoming.moderation
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class CfhChatlogData
   {
       
      
      private var var_1620:int;
      
      private var var_2159:int;
      
      private var var_1544:int;
      
      private var var_2160:int;
      
      private var var_117:RoomChatlogData;
      
      public function CfhChatlogData(param1:IMessageDataWrapper)
      {
         super();
         this.var_1620 = param1.readInteger();
         this.var_2159 = param1.readInteger();
         this.var_1544 = param1.readInteger();
         this.var_2160 = param1.readInteger();
         this.var_117 = new RoomChatlogData(param1);
         Logger.log("READ CFHCHATLOGDATA: callId: " + this.var_1620);
      }
      
      public function get callId() : int
      {
         return this.var_1620;
      }
      
      public function get callerUserId() : int
      {
         return this.var_2159;
      }
      
      public function get reportedUserId() : int
      {
         return this.var_1544;
      }
      
      public function get chatRecordId() : int
      {
         return this.var_2160;
      }
      
      public function get room() : RoomChatlogData
      {
         return this.var_117;
      }
   }
}
