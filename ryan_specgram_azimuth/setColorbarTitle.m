function setColorbarTitle(colorbarHandle,colorbarTitle);

axes(colorbarHandle);
set(colorbarHandle,'Title',...
    text('String',colorbarTitle,'color','k','Units','normalized','Position'...
    ,[0.5 1.01],'VerticalAlignment','baseline','HorizontalAlignment','center'))
