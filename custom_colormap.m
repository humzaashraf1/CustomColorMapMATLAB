function cmap = custom_colormap(img, n)
    
    % Get the size of the image
    [rows, cols, ~] = size(img);
    
    % Divide the x dimension into 12 parts
    parts = 12;
    part_size = cols / parts;
    
    % Initialize an empty array to store the color values
    color_values = zeros(parts, 3);
    
    % Loop through each part
    for i = 1:parts
        % Get the starting and ending x coordinates of the current part
        start_x = (i-1) * part_size + 1;
        end_x = start_x + part_size - 1;
        
        % Get the color value of the middle point in the current part
        x = round((start_x + end_x) / 2);
        y = round(rows / 2);
        color_values(i,:) = img(y,x,:);
    end
    
    color_values = color_values/256;

    % Generate colormap of length n
    cmap = flipud([
        color_values
    ]);
    cmap = interp1(linspace(1,size(cmap,1),size(cmap,1)),cmap,linspace(1,size(cmap,1),n),'spline');
end
