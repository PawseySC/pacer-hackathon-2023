# Access to Setonix during PaCER Hackathon 2023

All PaCER teams and mentors should have access to __PCon23Hackathon__ reservation on Setonix. The reservations includes:
- 10x Setonix GPU nodes (gpu partition)
- 2x Setonix GPU highmem nodes (gpu-highmem partition)
- 10x Setonix CPU nodes (work partition)


    setonix-02:~> scontrol show reservation=PCon23Hackathon
    ReservationName=PCon23Hackathon StartTime=Tomorr 17:00 EndTime=23 Sep 20:00 Duration=7-03:00:00
    Nodes=nid[001020-001032,002072,002090,002094,002096,002142,002144,002160,002162,002180,002182,002200,002202,002892,002894,002896] NodeCnt=28 CoreCnt=2624 Features=(null) PartitionName=(null)
    Flags=IGNORE_JOBS,SPEC_NODES
    TRES=cpu=5248
    Users=(null) Groups=(null) Accounts=director2188,director2188-gpu,director2183,director2183-gpu,bq2,bq2-gpu,director2187,director2187-gpu,fc8,fc8-gpu,d35,d35-gpu,director2196,director2196-gpu,director2178,director2178-gpu,w47,w47-gpu,pawsey0001,pawsey0001-gpu,pawsey0007,pawsey0007-gpu,director2192,director2192-gpu
    Licenses=(null) State=INACTIVE BurstBuffer=(null) Watts=n/a
    MaxStartDelay=(null)

## Requesting GPU node - example
        salloc -N 1 -pgpu --reservation=PCon23Hackathon -A PROJECT-gpu

## Requesting GPU highmem node - example
        salloc -N 1 -pgpu-highmem --reservation=PCon23Hackathon -A PROJECT-gpu

## Requesting CPU node - example
        salloc -N 1 -pwork --reservation=PCon23Hackathon -A PROJECT-gpu

