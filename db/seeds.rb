Scjoin.destroy_all
Sljoin.destroy_all
Sxjoin.destroy_all
Spjoin.destroy_all
Sejoin.destroy_all
Longtone.destroy_all
Scale.destroy_all
User.destroy_all
Session.destroy_all

Longtone.create(note:"A")
Longtone.create(note:"B♭")
Longtone.create(note:"B")
Longtone.create(note:"C")
Longtone.create(note:"C♯")
Longtone.create(note:"D")
Longtone.create(note:"E♭")
Longtone.create(note:"E")
Longtone.create(note:"F")
Longtone.create(note:"F♯")
Longtone.create(note:"G")
Longtone.create(note:"A♭")

Scale.create(note:"A", quality: 'maj')
Scale.create(note:"B♭", quality: 'maj')
Scale.create(note:"B", quality: 'maj')
Scale.create(note:"C", quality: 'maj')
Scale.create(note:"C♯", quality: 'maj')
Scale.create(note:"D", quality: 'maj')
Scale.create(note:"E♭", quality: 'maj')
Scale.create(note:"E", quality: 'maj')
Scale.create(note:"F", quality: 'maj')
Scale.create(note:"F♯", quality: 'maj')
Scale.create(note:"G", quality: 'maj')
Scale.create(note:"A♭", quality: 'maj')
Scale.create(note:"A", quality: 'min')
Scale.create(note:"B♭", quality: 'min')
Scale.create(note:"B", quality: 'min')
Scale.create(note:"C", quality: 'min')
Scale.create(note:"C♯", quality: 'min')
Scale.create(note:"D", quality: 'min')
Scale.create(note:"E♭", quality: 'min')
Scale.create(note:"E", quality: 'min')
Scale.create(note:"F", quality: 'min')
Scale.create(note:"F♯", quality: 'min')
Scale.create(note:"G", quality: 'min')
Scale.create(note:"A♭", quality: 'min')

#dummy User for dummy session below
dummy = User.create(username: 'dummy_user', instrument: 'x', password: 'x')
# dummy Session to attach recordings to before actual session is finalized and recordings are attached to it
Session.create(date: '', duration: '', focus_rating: 0, prod_rating: 0, notes:'', user_id: dummy.id)

puts 'so seedy'