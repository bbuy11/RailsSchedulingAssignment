/* Js for time in between work orders event*/

document.addEventListener("DOMContentLoaded", function() {
    document.querySelectorAll('.technician-column').forEach(function(column) {
      column.addEventListener('click', function(event) {
        if (event.target.classList.contains('work-order')) return;
        
        const columnBounds = column.getBoundingClientRect();
        const yPos = event.clientY - columnBounds.top;
        
        const workOrders = Array.from(column.querySelectorAll('.work-order')).sort((a, b) => parseInt(a.style.top) - parseInt(b.style.top));
        const previousOrder = workOrders.reverse().find(order => parseInt(order.style.top) <= yPos);
        const nextOrder = workOrders.find(order => parseInt(order.style.top) > yPos);
        
        const prevTime = previousOrder ? parseInt(previousOrder.style.top) + parseInt(previousOrder.style.height) : 0;
        const nextTime = nextOrder ? parseInt(nextOrder.style.top) : columnBounds.height;
        
        const availableTime = (nextTime - prevTime) / 60;
        alert(`Available time: ${availableTime} hours`);
      });
    });
  });
  