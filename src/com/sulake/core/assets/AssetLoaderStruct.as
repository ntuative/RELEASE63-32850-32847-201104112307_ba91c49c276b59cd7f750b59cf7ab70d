package com.sulake.core.assets
{
   import com.sulake.core.assets.loaders.IAssetLoader;
   import com.sulake.core.runtime.IDisposable;
   import com.sulake.core.runtime.events.EventDispatcher;
   
   public class AssetLoaderStruct extends EventDispatcher implements IDisposable
   {
       
      
      private var var_917:IAssetLoader;
      
      private var var_1969:String;
      
      public function AssetLoaderStruct(param1:String, param2:IAssetLoader)
      {
         super();
         this.var_1969 = param1;
         this.var_917 = param2;
      }
      
      public function get assetName() : String
      {
         return this.var_1969;
      }
      
      public function get assetLoader() : IAssetLoader
      {
         return this.var_917;
      }
      
      override public function dispose() : void
      {
         if(!disposed)
         {
            if(this.var_917 != null)
            {
               if(!this.var_917.disposed)
               {
                  this.var_917.dispose();
                  this.var_917 = null;
               }
            }
            super.dispose();
         }
      }
   }
}
