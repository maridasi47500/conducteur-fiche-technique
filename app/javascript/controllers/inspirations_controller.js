name=app/assets/javascripts/inspiration_hub.js

// ============ INSPIRATION TRIGGERS ============

// Random emotions/techniques that inspire creation
const EMOTIONS = [
  { name: "Colère retenue", description: "Tension sans explosion. Respiration courte. Mains serrées." },
  { name: "Joie fragile", description: "Comme un moment qu'on va perdre. Beau mais éphémère." },
  { name: "Rêve éveillé", description: "Flou. Pas de limites claires. Mouvement aquatique." },
  { name: "Chaos organisé", description: "Beaucoup de détails qui s'entrelacent. Presque belle." },
  { name: "Absence", description: "Le vide comme présence. Qu'est-ce qui manque ?" },
  { name: "Urgence douce", description: "Il faut bouger, mais avec grâce." },
  { name: "Mélancolie", description: "La beauté du temps qui passe." }
];

const TECHNIQUES = [
  { name: "Silence calculé", description: "Ajouter du silence force à écouter davantage." },
  { name: "Répétition brisée", description: "Presque pareil, mais légèrement différent à chaque fois." },
  { name: "Crescendo inversé", description: "Commence fort, devient doux. Rare. Troublant." },
  { name: "Collision", description: "Deux rythmes opposés en même temps." },
  { name: "Suspension", description: "On pense que c'est fini. Ça continue. Ça s'arrête vraiment." }
];

const CONDUCTORS = [
  { name: "Les Vagues", description: "Mouvement fluide comme l'océan. Respiré." },
  { name: "Tempête Intérieure", description: "Rage contenue. Pas d'explosion. Juste du tremblement." },
  { name: "L'Attente", description: "Rien ne se passe. Mais quelque chose va arriver." },
  { name: "Échos", description: "Ce que vous avez dit résonne. Longtemps." }
];

// Random trigger buttons
document.getElementById('random-emotion-btn')?.addEventListener('click', () => {
  const emotion = EMOTIONS[Math.floor(Math.random() * EMOTIONS.length)];
  showTrigger(emotion.name, emotion.description, 'emotion');
});

document.getElementById('random-conductor-btn')?.addEventListener('click', () => {
  const conductor = CONDUCTORS[Math.floor(Math.random() * CONDUCTORS.length)];
  showTrigger(conductor.name, conductor.description, 'conductor');
});

document.getElementById('random-technique-btn')?.addEventListener('click', () => {
  const technique = TECHNIQUES[Math.floor(Math.random() * TECHNIQUES.length)];
  showTrigger(technique.name, technique.description, 'technique');
});

function showTrigger(title, description, type) {
  const display = document.getElementById('trigger-display');
  document.getElementById('trigger-title').textContent = `✨ ${title}`;
  document.getElementById('trigger-content').textContent = description;
  
  // Store current trigger for form submission
  window.currentTrigger = { title, description, type };
  
  display.classList.remove('hidden');
  display.scrollIntoView({ behavior: 'smooth', block: 'center' });
}

// ============ NOTEBOOK (Local Storage) ============

// Save notebook entry
document.getElementById('notebook-form')?.addEventListener('submit', (e) => {
  e.preventDefault();
  
  const title = document.getElementById('entry-title').value || 'Sans titre';
  const content = document.getElementById('notebook-entry').value;
  
  if (!content.trim()) return;
  
  // Get saved entries or create new array
  let entries = JSON.parse(localStorage.getItem('notebookEntries') || '[]');
  
  // Add new entry
  entries.push({
    id: Date.now(),
    title,
    content,
    timestamp: new Date().toLocaleString('fr-FR')
  });
  
  // Save to localStorage
  localStorage.setItem('notebookEntries', JSON.stringify(entries));
  
  // Clear form
  document.getElementById('entry-title').value = '';
  document.getElementById('notebook-entry').value = '';
  
  // Update display
  displayNotebookEntries();
  
  // Show success message
  showNotification('✅ Entrée sauvegardée dans votre carnet', 'success');
});

function displayNotebookEntries() {
  const entries = JSON.parse(localStorage.getItem('notebookEntries') || '[]');
  const container = document.getElementById('notebook-entries');
  
  if (entries.length === 0) {
    container.innerHTML = '<p style="color: rgba(240, 233, 255, 0.6);">Aucune entrée encore...</p>';
    return;
  }
  
  container.innerHTML = entries
    .reverse()
    .map(entry => `
      <div class="notebook-entry">
        <h4>${escapeHtml(entry.title)}</h4>
        <p class="entry-text">${escapeHtml(entry.content).replace(/\n/g, '<br>')}</p>
        <p class="entry-timestamp">${entry.timestamp}</p>
        <button class="btn-delete-entry" data-id="${entry.id}">🗑️ Supprimer</button>
      </div>
    `)
    .join('');
  
  // Add delete listeners
  document.querySelectorAll('.btn-delete-entry').forEach(btn => {
    btn.addEventListener('click', (e) => {
      const id = parseInt(e.target.dataset.id);
      entries = entries.filter(entry => entry.id !== id);
      localStorage.setItem('notebookEntries', JSON.stringify(entries));
      displayNotebookEntries();
      showNotification('❌ Entrée supprimée', 'info');
    });
  });
}

// Display notebook entries on page load
document.addEventListener('DOMContentLoaded', () => {
  displayNotebookEntries();
  loadInterpretations();
  updateStats();
});

// ============ HUMAN VS MACHINE COMPARISON ============

document.getElementById('conductor-select')?.addEventListener('change', async (e) => {
  const conductorId = e.target.value;
  if (!conductorId) return;
  
  // Show loading
  const analysisDisplay = document.getElementById('machine-analysis');
  analysisDisplay.classList.remove('hidden');
  document.getElementById('machine-output').textContent = '⚙️ Analyse en cours...';
  
  try {
    // Call your backend to get AI analysis
    const response = await fetch(`/api/conducteurs/${conductorId}/analyze`, {
      method: 'GET',
      headers: { 'Content-Type': 'application/json' }
    });
    
    const data = await response.json();
    document.getElementById('machine-output').textContent = data.analysis || 'Analyse non disponible';
  } catch (error) {
    console.error('Error:', error);
    document.getElementById('machine-output').textContent = '❌ Erreur lors de l\'analyse';
  }
});

// Save interpretation
document.querySelector('.btn-save-interpretation')?.addEventListener('click', () => {
  const conductorId = document.getElementById('conductor-select').value;
  const interpretation = document.getElementById('human-interpretation').value;
  
  if (!conductorId || !interpretation.trim()) {
    showNotification('⚠️ Veuillez sélectionner un conducteur et écrire votre interprétation', 'warning');
    return;
  }
  
  // Save to localStorage
  let interpretations = JSON.parse(localStorage.getItem('interpretations') || '[]');
  interpretations.push({
    id: Date.now(),
    conductorId,
    interpretation,
    timestamp: new Date().toLocaleString('fr-FR')
  });
  
  localStorage.setItem('interpretations', JSON.stringify(interpretations));
  document.getElementById('human-interpretation').value = '';
  loadInterpretations();
  showNotification('✅ Votre interprétation est sauvegardée', 'success');
  updateStats();
});

function loadInterpretations() {
  const interpretations = JSON.parse(localStorage.getItem('interpretations') || '[]');
  const container = document.getElementById('interpretations-display');
  
  if (interpretations.length === 0) {
    container.innerHTML = '<p style="color: rgba(240, 233, 255, 0.6);">Aucune interprétation sauvegardée encore...</p>';
    return;
  }
  
  container.innerHTML = interpretations
    .reverse()
    .map(interp => `
      <div class="interpretation-card">
        <h4>Votre jugement</h4>
        <p class="interpretation-text">${escapeHtml(interp.interpretation).replace(/\n/g, '<br>')}</p>
        <p class="entry-timestamp">${interp.timestamp}</p>
      </div>
    `)
    .join('');
}

// ============ CREATE NEW CONDUCTOR ============

document.getElementById('new-conductor-form')?.addEventListener('submit', async (e) => {
  e.preventDefault();
  
  const name = document.getElementById('conductor-name').value;
  const feeling = document.getElementById('conductor-feeling').value;
  const tempo = document.getElementById('conductor-tempo').value;
  
  if (!name || !feeling) {
    showNotification('⚠️ Remplissez tous les champs', 'warning');
    return;
  }
  
  try {
    // Send to backend to create conductor
    const response = await fetch('/conducteurs', {
      method: 'POST',
      headers: { 'Content-Type': 'application/json' },
      body: JSON.stringify({
        conducteur: {
          title: name,
          notes: feeling,
          tempo_range: tempo
        }
      })
    });
    
    if (response.ok) {
      showNotification(`✅ "${name}" créé ! Maintenant, rendez-le technique.`, 'success');
      document.getElementById('new-conductor-form').reset();
      updateStats();
      
      // Save to history
      let createdConductors = JSON.parse(localStorage.getItem('createdConductors') || '[]');
      createdConductors.push({
        name,
        feeling,
        timestamp: new Date().toLocaleString('fr-FR')
      });
      localStorage.setItem('createdConductors', JSON.stringify(createdConductors));
    } else {
      showNotification('❌ Erreur lors de la création', 'error');
    }
  } catch (error) {
    console.error('Error:', error);
    showNotification('❌ Erreur réseau', 'error');
  }
});

// ============ STATS & PROGRESS ============

function updateStats() {
  const entries = JSON.parse(localStorage.getItem('notebookEntries') || '[]');
  const interpretations = JSON.parse(localStorage.getItem('interpretations') || '[]');
  const createdConductors = JSON.parse(localStorage.getItem('createdConductors') || '[]');
  
  // Count unique emotions from notebook
  const uniqueEmotions = new Set(entries.map(e => e.title)).size;
  
  document.getElementById('total-conducteurs').textContent = createdConductors.length;
  document.getElementById('total-emotions').textContent = uniqueEmotions;
  document.getElementById('total-insights').textContent = interpretations.length;
  
  // Update timeline
  const createdDisplay = document.getElementById('creation-timeline');
  if (createdConductors.length === 0) {
    createdDisplay.innerHTML = '<p style="color: rgba(240, 233, 255, 0.6);">Aucune création encore. Commencez...</p>';
    return;
  }
  
  createdDisplay.innerHTML = createdConductors
    .map((c, i) => `
      <div class="timeline-item">
        <div class="timeline-content">
          <h4>#${createdConductors.length - i} — ${escapeHtml(c.name)}</h4>
          <p>${escapeHtml(c.feeling)}</p>
          <p class="entry-timestamp">${c.timestamp}</p>
        </div>
      </div>
    `)
    .join('');
}

// ============ UTILITY FUNCTIONS ============

function showNotification(message, type = 'info') {
  const notification = document.createElement('div');
  notification.textContent = message;
  notification.style.cssText = `
    position: fixed;
    top: 20px;
    right: 20px;
    padding: 1rem 1.5rem;
    background: ${type === 'success' ? '#ff6b6b' : type === 'error' ? '#ff4444' : '#ffd93d'};
    color: ${type === 'success' || type === 'error' ? 'white' : '#333'};
    border-radius: 4px;
    z-index: 10000;
    animation: slideIn 0.3s ease-out;
    font-weight: bold;
  `;
  
  document.body.appendChild(notification);
  
  setTimeout(() => {
    notification.remove();
  }, 3000);
}

function escapeHtml(text) {
  const div = document.createElement('div');
  div.textContent = text;
  return div.innerHTML;
}

// ============ NOTEBOOK TO RESOURCES ============

// Add resources to notebook
document.querySelectorAll('.btn-notebook').forEach(btn => {
  btn.addEventListener('click', (e) => {
    const resourceId = e.target.dataset.resourceId;
    const resourceTitle = e.target.closest('.resource-card').querySelector('h3').textContent;
    
    // Auto-populate notebook textarea
    const textarea = document.getElementById('notebook-entry');
    textarea.value = `📖 Ressource : ${resourceTitle}\n\nMa réflexion :\n`;
    textarea.focus();
    
    // Scroll to notebook
    document.querySelector('.artistic-notebook').scrollIntoView({ behavior: 'smooth' });
    
    showNotification('📖 Ressource ajoutée à votre carnet. Écrivez vos pensées...', 'info');
  });
});
