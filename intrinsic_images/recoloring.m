function [new_albedo] = recoloring(albedo)

albedoR = albedo(:,:,1);
albedoG = albedo(:,:,2);
albedoB = albedo(:,:,3);

colorR = mean( albedoR(albedoR > 0), 'all')
colorG = mean( albedoG(albedoG > 0), 'all')
colorB = mean( albedoB(albedoB > 0), 'all')

albedoR(:) = 0;
albedoG(albedoG > 0) = 255;
albedoB(:) = 0;
new_albedo = albedo;
new_albedo(:,:,1) = albedoR;
new_albedo(:,:,2) = albedoG;
new_albedo(:,:,3) = albedoB;

end