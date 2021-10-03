package com.sulake.habbo.communication.messages.parser.help
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class TutorialStatusMessageParser implements IMessageParser
   {
       
      
      private var var_1215:Boolean;
      
      private var var_1214:Boolean;
      
      private var var_1484:Boolean;
      
      public function TutorialStatusMessageParser()
      {
         super();
      }
      
      public function get hasChangedLooks() : Boolean
      {
         return this.var_1215;
      }
      
      public function get hasChangedName() : Boolean
      {
         return this.var_1214;
      }
      
      public function get hasCalledGuideBot() : Boolean
      {
         return this.var_1484;
      }
      
      public function flush() : Boolean
      {
         this.var_1215 = false;
         this.var_1214 = false;
         this.var_1484 = false;
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this.var_1215 = param1.readBoolean();
         this.var_1214 = param1.readBoolean();
         this.var_1484 = param1.readBoolean();
         return true;
      }
   }
}
