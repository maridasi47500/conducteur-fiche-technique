name=app/assets/javascripts/database_art.js

// View artistic data by column
document.querySelectorAll('.view-data-btn').forEach(btn => {
  btn.addEventListener('click', (e) => {
    const table = e.target.dataset.table;
    const column = e.target.dataset.column;
    
    showColumnData(table, column);
  });
});

function showColumnData(table, column) {
  // Fetch data from backend
  fetch(`/api/database-art/${table}/${column}`)
    .then(r => r.json())
    .then(data => {
      displayColumnData(table, column, data);
    });
}

function displayColumnData(table, column, data) {
  const modal = document.createElement('div');
  modal.className = 'data-modal';
  modal.innerHTML = `
    <div class="modal-content">
      <button class="close-modal">✕</button>
      <h2>${table}.${column}</h2>
      <div class="data-list">
        ${data.map(item => `
          <div class="data-item">
            <strong>${item.title || item.name}</strong>
            <p>${item[column]}</p>
          </div>
        `).join('')}
      </div>
    </div>
  `;
  
  document.body.appendChild(modal);
  
  modal.querySelector('.close-modal').addEventListener('click', () => modal.remove());
}

// Link resource to conductor
document.querySelectorAll('.btn-link-resource').forEach(btn => {
  btn.addEventListener('click', (e) => {
    const resourceId = e.target.dataset.resourceId;
    // TODO: Create link in database
  });
});
