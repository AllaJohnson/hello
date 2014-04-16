# Hits counter
@@hit_counts = 0

# Hits increment method
def hit
  log('hti() method called')
  @@hit_counts += 1
end
