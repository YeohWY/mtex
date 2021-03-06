classdef omegaSections < pfSections
     
  methods
    
    function oS = omegaSections(CS1,CS2,varargin)
            
      oS = oS@pfSections(CS1,CS2);
                
      oS.maxOmega = 2*pi / CS1.nfold(oS.h1);
      
      % get sections
      oS.omega = linspace(0,oS.maxOmega,1+get_option(varargin,'sections',6));
      oS.omega(end) = [];
      oS.omega = get_option(varargin,'omega',oS.omega,'double');
      
      oS.updateTol(oS.omega);
      
      oS.referenceField = S2VectorField.sigma;
      %if nargin < 4, r_ref = xvector; end
      %oS.referenceField = S2VectorField.polassr(r_ref);
      
    end            
  end  
end
