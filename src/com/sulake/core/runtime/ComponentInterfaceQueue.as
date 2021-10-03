package com.sulake.core.runtime
{
   class ComponentInterfaceQueue implements IDisposable
   {
       
      
      private var var_1890:IID;
      
      private var var_1065:Boolean;
      
      private var var_1198:Array;
      
      function ComponentInterfaceQueue(param1:IID)
      {
         super();
         this.var_1890 = param1;
         this.var_1198 = new Array();
         this.var_1065 = false;
      }
      
      public function get identifier() : IID
      {
         return this.var_1890;
      }
      
      public function get disposed() : Boolean
      {
         return this.var_1065;
      }
      
      public function get receivers() : Array
      {
         return this.var_1198;
      }
      
      public function dispose() : void
      {
         if(!this.var_1065)
         {
            this.var_1065 = true;
            this.var_1890 = null;
            while(this.var_1198.length > 0)
            {
               this.var_1198.pop();
            }
            this.var_1198 = null;
         }
      }
   }
}
